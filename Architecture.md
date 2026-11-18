# Architecture.md: Lafzio System Architecture

Based on the Lafzio SRDS (sections 2.1, 3.3, 4 and 5). Rules for writing code are in `Rules.md`; visuals are in `Design.md`.

---

## 1. Overview

Lafzio is an **Android-only** (first version) assistive chat and video-call app. It uses a **hybrid architecture**: heavy sensing and matching run on the device, shared data lives in the cloud, and a small backend handles the AI jobs that cannot run on a phone.

```
                 +----------------------------------+
                 |        Android device            |
                 |  Flutter app (Dart)              |
                 |  - UI / state / repositories     |
                 |  - SQLite (chat cache, signs)    |
                 |  - MediaPipe (hand landmarks)    |
                 |  - DTW sign matching             |
                 |  - YAMNet (danger sounds)        |
                 |  - 3D avatars (.glb)             |
                 +-----+-----------+-----------+----+
                       |           |           |
            HTTPS / WS |   HTTPS   |   WebRTC (P2P, encrypted)
                       v           v           v
              +--------------+  +-----------+  +-------------+
              |  Supabase    |  |  FastAPI  |  | Peer device |
              |  Auth, DB,   |  |  Whisper, |  | (other user)|
              |  Realtime,   |  |  text-to- |  +-------------+
              |  signaling   |  |  sign map |
              +--------------+  +-----------+
```

### Where each job runs

| Job | Runs on | Technology |
|---|---|---|
| Register, login, profiles | Cloud | Supabase Auth + PostgreSQL |
| Real-time chat delivery | Cloud | Supabase Realtime (WebSockets) |
| Call signaling (offer, answer, ICE) | Cloud | Supabase Realtime |
| Video and skeleton streaming | Device to device | WebRTC video + Data Channels |
| Chat cache, custom sign dictionary | Device | SQLite |
| Hand landmark extraction | Device | Google MediaPipe |
| Sign matching, ranking, ambiguity | Device | DTW |
| Danger-sound classification | Device | YAMNet |
| Live speech recognition (Urdu, English) | Device | Android speech recognizer |
| Voice-message transcription | Backend | Whisper on FastAPI |
| Text-to-sign token mapping | Backend | FastAPI endpoints |
| Avatar rendering and animation | Device | .glb models in Flutter |
| Haptic and visual alerts | Device | Flutter vibration / haptic plugins |

## 2. Core Architecture Rules

These come from `Rules.md` and the SRDS and apply everywhere:

1. UI, state management and native platform bridges are strictly separate.
2. Raw camera frames never go to any server. Calls are peer-to-peer WebRTC; low-bandwidth mode sends only skeleton JSON over Data Channels instead of video.
3. Ambient audio for danger detection never leaves the device.
4. ML inference and frame processing never run on the main UI thread.
5. Chat history and the custom sign dictionary must work offline.
6. An error in one module must not stop the others, and the user always sees what happened.

## 3. Client Layers (Flutter)

Each feature is split into the same four layers. Dependencies point downward only.

```
presentation   Screens and widgets. No business logic, no direct database or network calls.
     |
application    Riverpod providers / notifiers. Holds state, calls use cases.
     |
domain         Plain Dart models and repository interfaces. No Flutter, no packages.
     |
data           Repository implementations: Supabase, SQLite, FastAPI client, platform channels.
```

- **State management:** Riverpod (`flutter_riverpod`). One notifier per screen or flow, testable without UI.
- **Navigation:** `go_router`, with a redirect that sends users without a valid session to onboarding / login.
- **Dependency injection:** Riverpod providers. Repositories are exposed as providers so tests can override them.
- **Typing:** no `dynamic`, null-safety everywhere.

## 4. Project Structure

```
fyp-ashir-omi/
  assets/                  Shared design assets (icons, hand-sign images, avatars, .glb)
  fyp_app/                 Flutter app
    lib/
      main.dart
      app.dart             MaterialApp.router, theme mode
      core/
        theme/             app_theme.dart (design tokens)
        router/            app_router.dart
        config/            Supabase and backend settings (read from env, never committed)
        errors/            Failure types, error messages shown to the user
        utils/
      shared/
        widgets/           ChatBubble, GlassButton, GlassNavBar, GroupedCard, OtpBox...
      features/
        onboarding/        Splash, intro, phone, verify, theme, user type, profile, avatar, permissions
        auth/              Supabase auth, session
        chat/              Chat list, conversation, message status, voice messages, local cache
        recognition/       Camera pipeline, landmarks, DTW, ambiguity pop-up
        custom_signs/      Record, verify, synonyms, conflicts, dictionary
        translation/       Translate to sign (images), speech to sign, keyboard, token mapping
        avatars/           Avatar rendering, sequence playback, live retargeting
        calls/             Signaling, WebRTC, low-bandwidth mode, call history
        alerts/            Haptic patterns, visual cues, danger-sound detection
        face_to_face/      Two-way camera translation
        help/              Complaint / help request
        settings/          Profile, avatar, speech, language, background detection
      platform/            Dart side of native bridges (MediaPipe, YAMNet, haptics)
    android/               Native Kotlin code for MediaPipe / YAMNet bridges
    test/
  ml-engine/               Python workspace (see section 9)
  Architecture.md  Design.md  Memory.md  Phases.md  PRD.md  README.md  Rules.md
```

Each folder under `features/` has `presentation/`, `application/`, `domain/`, `data/`.

## 4.1 The nine modules

The SRDS describes nine modules. Each maps to feature folders:

| Module | Feature folder(s) | Main SRDS requirements |
|---|---|---|
| User accounts and profile | `onboarding`, `auth`, `settings` | LFR-001 to 005 |
| Messaging | `chat` | LFR-006 to 013 |
| Sign recognition | `recognition` | LFR-014 to 021 |
| Custom signs | `custom_signs` | LFR-022 to 026 |
| Translation to sign and keyboard | `translation` | LFR-027 to 033, 035 to 037 |
| Avatars | `avatars` | LFR-034, 038 to 041 |
| Video calling | `calls` | LFR-042 to 049 |
| Face-to-face and haptics | `face_to_face`, `alerts` | LFR-050 to 055 |
| Danger alerts and help | `alerts`, `help` | LFR-056 to 062 |

## 5. Threads and Isolates

The main isolate only draws UI and handles state. Heavy work is moved off it.

| Work | Where it runs | Why |
|---|---|---|
| Camera frames to hand landmarks (MediaPipe) | Native Android thread (Kotlin), results sent to Dart over an `EventChannel` | MediaPipe is a native library; keeps frames out of the UI thread |
| DTW matching, ranking, ambiguity detection | Dart background isolate | CPU heavy, must not block UI |
| YAMNet classification | Native thread, events sent to Dart | Runs continuously, even during calls |
| Whisper transcription | FastAPI server | Too heavy for the phone |
| SQLite reads and writes | Background isolate or async DB driver | Keeps list scrolling smooth |

Only small messages cross thread boundaries (landmark arrays, class names, result objects), never raw frames.

## 6. Data

### 6.1 Cloud (Supabase PostgreSQL)

Entities (refine columns against the ERD, SRDS Figure 5.5):

| Entity | Purpose |
|---|---|
| `profiles` | User id, name, user name, phone, user type (deaf / hearing), avatar, settings |
| `messages` | Sender, receiver, type (text / voice), content or audio path, status, timestamp |
| `calls` | Caller, callee, start time, duration, missed flag |
| `help_requests` | User id, subject, message, created time |
| signaling channel | Realtime-only messages for call setup; not stored |

Security:
- Row Level Security on every table: a user reads and writes only their own profile and their own conversations.
- Auth through Supabase; no feature screen is reachable without a session.
- Voice files live in a private storage bucket with access limited to the two people in the chat.
- Keys and URLs come from environment config, never committed to git.

### 6.2 Device (SQLite via `sqflite`)

| Table | Purpose |
|---|---|
| `messages_cache` | Local copy of chat history for instant and offline loading |
| `custom_signs` | Word, normalized vector sequences from the 3 to 5 recordings, adaptive threshold |
| `sign_synonyms` | Several signs mapped to one word |
| `pending_outbox` | Messages written offline, sent when the network returns |

The custom sign dictionary lives **only** on the device (privacy requirement).

## 7. Key Flows

### 7.1 Send and receive a text message
1. UI sends text to the chat notifier.
2. Repository writes it to SQLite (shown immediately) and inserts it into Supabase.
3. The receiver gets it over Realtime, stores it in SQLite, and triggers the new-message haptic and visual cue.
4. Status moves sent, delivered, read.

### 7.2 Sign to text (in chat)
1. Camera frames go to MediaPipe (native), which returns landmarks and joint angles.
2. A background isolate runs DTW against the local dictionary and returns ranked candidates with scores.
3. If the top candidates are nearly equal, or a sign has two meanings, the sign is queued and the **tap-selection pop-up** shows on the Deaf user's screen. It has no timeout.
4. The chosen meaning updates the adaptive thresholds, then the text is sent as a normal message.

### 7.3 Voice message transcription
1. A Deaf user taps Transcribe on a received voice message.
2. The app sends the audio to FastAPI (HTTPS); Whisper returns text.
3. The user chooses to read it as text or as static signs. Transcripts are not stored; each request transcribes again.

### 7.4 Translate to sign (in chat)
Each letter or digit maps to a static hand-sign image from `assets/`. Other characters stay plain text. No avatar is used in direct messages.

### 7.5 Video call
1. Caller writes an offer through the Supabase signaling channel; callee gets the incoming-call haptic (repeating) and call screen.
2. Answer and ICE candidates are exchanged through the same channel; WebRTC connects the two devices directly.
3. **Normal mode:** WebRTC audio and video. **Low-bandwidth mode:** skeleton JSON over a Data Channel; the receiver drives the sender's avatar.
4. Hearing user speech goes to the Android speech recognizer, then to token mapping, then the avatar signs on the Deaf user's screen.
5. Deaf user signs go through 7.2; confirmed meaning shows as a caption (and speech if enabled).
6. Danger-sound detection runs for the whole call and cannot be turned off.

### 7.6 Danger-sound alert
YAMNet classifies microphone audio on the device. For siren, fire/smoke alarm, glass breaking, car horn or scream, the app fires the strong urgent haptic and a banner or screen flash.

Microphone sharing: WebRTC and YAMNet must read the same audio stream during calls. This needs testing on real Android devices early.

### 7.7 Speech to sign and avatars
Text goes to the backend token mapper (word by word plus core keyword extraction). Known words play pre-baked `.glb` animation sequences; unknown words fall back to A to Z fingerspelling. Each participant has their own avatar and animation queue so two people signing at once never conflict.

## 8. Backend (FastAPI)

Small, stateless service.

| Endpoint | Input | Output |
|---|---|---|
| `POST /transcribe` | Audio file | Transcript (JSON) |
| `POST /text-to-sign` | Text | Sign token sequence (JSON) |
| `GET /health` | none | Status |

- HTTPS only. Requests carry the Supabase auth token; the backend verifies it before work.
- Audio is deleted after transcription.
- Deployment target and hosting (free tier or local for the demo) is a project decision; see open decisions.

## 9. ml-engine

Python workspace for work that is easier outside the app:
- recording and inspecting landmark sequences,
- tuning DTW thresholds and testing ambiguity rules on saved recordings,
- preparing the core vocabulary and sign token map,
- testing Whisper and token mapping before they go behind the API.

What is proven here is then ported to the Dart/Kotlin pipeline in `fyp_app`. The app itself does not depend on `ml-engine` at runtime unless the FastAPI backend is also kept in this folder (see open decisions).

## 10. Error Handling and Offline Behaviour

| Situation | Behaviour |
|---|---|
| No network | Chats and custom signs still open from SQLite; new messages go to `pending_outbox` and send later |
| Lost connection during a call | Reconnect attempt, clear status message; chat history is never lost |
| Low-light camera | Show a hint to improve lighting; keep trying, never crash |
| Speech misrecognition | Show the recognized text so the user can see and correct it |
| Failed transcription | Show a retry message; other features keep working |
| Module failure | Isolated; show a clear message instead of failing silently |

## 11. Testing

- **Unit:** notifiers, repositories (with overridden providers), DTW matching on recorded landmark sequences.
- **Widget:** screens with fake providers, in light and dark themes.
- **On device:** haptic patterns, danger sounds with sample audio, WebRTC plus YAMNet microphone sharing.
- Performance targets are defined after the first prototype is benchmarked on real devices (SRDS 4.1).

## 12. Build Order

Phase 0 foundation, 1 onboarding and auth, 2 chat, 3 sign recognition and custom signs, 4 translation and voice messages, 5 calls and avatars, 6 face-to-face, haptics, danger alerts, help. Details are tracked in `Phases.md`.

## 13. Open Decisions

- Where the FastAPI backend lives (inside `ml-engine/` or a separate `backend/` folder) and where it is hosted for the demo.
- Exact WebRTC package and 3D avatar rendering package for Flutter (choose before Phase 5; prototype first).
- Phone-number login: Supabase SMS needs an SMS provider; confirm which one works within the project budget, or use a fallback for the demo.
- SRDS LFR-058 is still marked "to confirm": whether mandatory danger detection runs on both devices or only the Deaf user's.