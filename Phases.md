# Development Phases & Parallel Roadmap (`Phases.md`)

Structured for **two parallel developers** so neither blocks the other:
- **Track A (App Dev — Flutter, UI, State, Supabase, WebRTC, 3D Rendering):** Builds `fyp_app/` using interface contracts and mock providers until Track B's native bridges and FastAPI endpoints are ready to plug in.
- **Track B (ML & Backend Dev — MediaPipe, DTW, YAMNet, Whisper, FastAPI, Native Bridges):** Builds and benchmarks pipelines in `ml-engine/`, exposes FastAPI endpoints, and delivers Android Kotlin `EventChannel`/`MethodChannel` bridges + `.glb` avatar animations.

**Key Rules:**
- **Splash behavior:** Static splash (`0a`) runs on normal launches after setup is complete; animated first-launch intro (`0b`, ~3.5 s, tap to skip) runs when the app is new or setup is unfinished[cite: 4].
- **Deferred item:** Custom haptics are deferred to the final polish phase only if time permits after core features are complete; core fixed haptics + visual cues follow `Design.md` and the SRDS[cite: 1, 2].

---

- [ ] **Phase 0: Shared Contracts & Repo Foundation (Both Devs — Day 1–2)**
  - **Shared Interface Contract (Unblocks Parallel Work):**
    - Lock JSON schemas and Dart `domain/` interfaces for:
      1. `LandmarkFrame` & `SignCandidate` (MediaPipe -> DTW -> Dart `EventChannel`)[cite: 1, 2].
      2. `DangerSoundEvent` (`siren`, `fire_alarm`, `glass_break`, `car_horn`, `scream` from YAMNet `EventChannel`)[cite: 1, 2].
      3. FastAPI REST contracts: `POST /transcribe` (audio in -> transcript JSON out) and `POST /text-to-sign` (text in -> sign token sequence JSON out)[cite: 1, 2].
      4. WebRTC low-bandwidth skeletal JSON packet format and uniform `.glb` avatar bone naming convention[cite: 1, 2].
  - **Track A (App):** Verify `fyp_app` folder structure, `AppColors` (`ThemeExtension`), typography (`Inter`), shared widgets (`ChatBubble`, `GlassButton`, `GlassNavBar`, `GroupedCard`, `OtpBox`), `go_router` guards, and mock repositories for ML/Backend[cite: 1, 2, 3, 4].
  - **Track B (ML/Backend):** Set up `ml-engine/` Python environment, verify `hand_landmarker.task` in `ml-engine/sl2v/tracker.py`, and scaffold FastAPI app with `/health` and stubbed `/transcribe` + `/text-to-sign` endpoints[cite: 1, 2].

- [ ] **Phase 1: Onboarding/Auth + Local DB (Track A) || Landmark & DTW Engine (Track B)**
  - **Track A (App):**
    - Implement static splash (`0a`), animated first-launch intro (`0b`, tap to skip), and onboarding screens (`1`–`9`: Get started, Phone +92, OTP verify, Theme Light/Dark/Auto with live preview, Role deaf/mute vs. hear/speak, Profile + photo, Avatar selection Nova/Remy/Kai/Juno/Sage/Milo, Permissions, All set) + Login[cite: 2, 4].
    - Set up Supabase Auth, PostgreSQL tables + RLS (`profiles`, `messages`, `calls`, `help_requests`), and local SQLite (`sqflite`) tables (`cached_messages`, `pending_outbox`, `sign_words`, `custom_signs`, `sign_recordings`)[cite: 1, 2].
  - **Track B (ML/Backend):**
    - Build and test 3D hand landmark extraction, finger-joint angle calculation, and motion-path normalization in `ml-engine/sl2v/`[cite: 1, 2].
    - Implement DTW sign matching with adaptive thresholds, recording quality verification, look-alike conflict detection, and ambiguity scoring on saved sequences[cite: 1, 2].

- [ ] **Phase 2: Messaging, Keyboard & Translation UI (Track A) || FastAPI Whisper & Token Mapper (Track B)**
  - **Track A (App):**
    - Build bottom nav (`Chats`, `Calls`, `Signs`, `Translate`, `Me`), `Chats` list, `New Chat`, `Contact Info`, and `Conversation` screen with offline cache and `pending_outbox` sync[cite: 1, 2, 3].
    - Build in-chat "Show as signs" (static hand-sign images for letters/digits; plain text for symbols/punctuation/emojis), custom Lafzio keyboard with optional sign hints, Hearing-user voice recording, and Voice Transcription UI (wired to FastAPI stub/live endpoint)[cite: 1, 2, 3].
  - **Track B (ML/Backend):**
    - Implement `POST /transcribe` using Whisper (stateless; deletes audio immediately after returning transcript)[cite: 1, 2].
    - Implement `POST /text-to-sign` (word-by-word mapping + core keyword extraction + A–Z fingerspelling fallback) and finalize the standardized core PSL vocabulary map[cite: 1, 2].

- [ ] **Phase 3: Custom Signs & Recognition UI (Track A) || Android Native MediaPipe & YAMNet Bridges (Track B)**
  - **Track A (App):**
    - Build `Signs` dictionary screen, `Teach a Sign` screen (3–5 takes progress ring, "Both hands visible" indicator, look-alike conflict banner), `Verify/Detail` screen, in-chat `Sign Camera`, and no-timeout `AmbiguityPopup` with sign queuing (tested with mock `MediaPipeChannel` stream)[cite: 1, 2, 3].
    - Port DTW matching algorithm into a Dart background isolate reading from local SQLite[cite: 1].
  - **Track B (ML/Backend):**
    - Implement Android Kotlin `MediaPipe` camera-to-landmark pipeline over `EventChannel` (`fyp_app/android/...`) keeping raw frames off the UI thread[cite: 1, 2].
    - Implement Android Kotlin `YAMNet` TFLite on-device audio classifier over `EventChannel` for sirens, fire/smoke alarms, glass breaking, car horns, and screams[cite: 1, 2].

- [ ] **Phase 4: 3D Avatar Stage, Translate Tab & Settings/Help (Track A) || `.glb` Avatar Animations & Retargeting Math (Track B)**
  - **Track A (App):**
    - Integrate 3D `.glb` viewport widget with per-participant animation queues, `Translate` tab (`Speech to Sign` / `Sign to Text` toggle, word queue, `A · N · Y · A` fingerspelling chips), and Android built-in speech recognizer (Urdu/English) + TTS[cite: 1, 2, 3].
    - Build `Me` / Settings screens (`My Signs`, `Sound Alerts`, `Notifications`, `Privacy & Security`, `Text & Display`, `Help & Tutorials`) and Supabase `help_requests` form[cite: 2, 3].
  - **Track B (ML/Backend):**
    - Prepare optimized `.glb` avatar assets (compressed textures, uniform bone naming, stylized non-likeness designs) and pre-baked core sign animation clips[cite: 1].
    - Deliver landmark-to-bone live retargeting math and viseme/lip-sync mapping rules for Dart/Flutter integration[cite: 1, 2].

- [ ] **Phase 5: Integration, WebRTC Calling & Face-to-Face Mode (Both Devs)**
  - **Track A (App):**
    - Implement 1-to-1 WebRTC video calling with Supabase Realtime signaling, incoming-call haptic + visual alert, call history, and low-bandwidth mode (skeletal JSON over WebRTC Data Channels driving sender's avatar)[cite: 1, 2].
    - Build single-camera two-way `Face-to-Face` mode with dual labeled avatars[cite: 2].
  - **Track B (ML/Backend) + Joint Plug-In:**
    - Swap Track A's mock providers with Track B's live Kotlin `MediaPipeChannel`, `YamnetChannel`, and deployed FastAPI endpoints[cite: 1].
    - Test and tune shared microphone access between WebRTC and mandatory `YAMNet` danger detection on real Android devices[cite: 1, 2].

- [ ] **Phase 6: Testing, Optimization & Optional Custom Haptics (Both Devs)**
  - **Track A (App):** Widget tests (light/dark themes, reduced motion, font scaling, 44x44 touch targets), offline/reconnect recovery, local date-stamped transcript export, and `.glb` memory profiling on low-end Android devices[cite: 1, 2].
  - **Track B (ML/Backend):** End-to-end latency benchmarks (MediaPipe + DTW isolate + YAMNet), DTW threshold tuning on real user recordings, and FastAPI load/timeout verification[cite: 1, 2].
  - *(Optional / Time-Permitting)* Add user-customizable haptic patterns only after the core app and polish are complete[cite: 1, 2].