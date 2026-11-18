# Design.md: Lafzio UI Design System

Source of truth: `lafzio-ui.html` (6 core screens + app icon) and `Lafzio_UI__onboarding_screens.html` (splash, intro, 9 setup screens). If this file and the HTML ever disagree, the HTML wins; update this file.

Flutter implementation: tokens live in `fyp_app/lib/core/theme/app_theme.dart` (`AppColors` ThemeExtension, read with `context.colors`). Never hard-code a colour in a widget.

---

## 1. Brand

- **Name:** Lafzio. **Tagline:** "Say it your way."
- **Mascot:** Lafzi, a friendly character who flies in and waves on first launch ("Hi, I'm Lafzi!"). Used on splash, intro, and empty states.
- **App icon:** "Lafzi Waves". Must stay readable at 160, 76, 40 and 29 px.
- **Look:** iOS-style, clean, glassmorphism accents, one blue accent colour, generous spacing.
- **Tone of voice:** short, warm, plain words. No jargon. Many users have limited written-language literacy, so every key action also has an icon or visual cue.

## 2. Design Principles

1. **Visual first.** Every sound, alert and state has a visual (and haptic) equivalent. Never rely on audio alone.
2. **Ask, don't guess.** Ambiguous signs show a tap-selection pop-up instead of auto-sending a possibly wrong meaning.
3. **Same app for both users.** Deaf and hearing users share the same chats and calls; only the available tools differ.
4. **Light and dark are equal.** Every screen must work in both themes from the same markup. Theme options: Light, Dark, Auto (follows the phone).
5. **Calm, not busy.** One primary action per screen.

## 3. Colour Tokens

Use semantic names, not hex values, in code.

| Token | Light | Dark | Use |
|---|---|---|---|
| `bg` | #FFFFFF | #171717 | Screen background |
| `bgGrouped` | #F2F2F7 | #171717 | Settings / "Me" screen background |
| `text` | #000000 | #E8E8EC | Primary text |
| `sec` | rgba(60,60,67,.62) | rgba(235,235,245,.62) | Secondary text, inactive icons |
| `secFaint` | rgba(60,60,67,.35) | rgba(235,235,245,.40) | Placeholders, empty rings |
| `accent` | #0A6CF5 | #5AA9FF | Buttons, links, active tab, selection |
| `accentSoft` | accent at 14% | accent at 14% | Soft fills, selection halo |
| `onAccent` | #FFFFFF | #14100A | Text/icons on accent |
| `outA` / `outB` | #2F8BFF / #0A6CF5 | #7DBBFF / #4A98F0 | Outgoing bubble gradient (top to bottom) |
| `bubbleIn` | #E9E9EB | #232326 | Incoming bubble |
| `card` | #F2F2F7 | #232326 | Cards, OTP boxes, inputs |
| `raised` | #E5E5EA | #303034 | Raised surfaces |
| `sep` | rgba(60,60,67,.18) | rgba(84,84,88,.55) | Dividers (0.5 px) |
| `green` | #1A8A3C | #32D74B | Success, "Allowed", online |

Settings icon tiles (30x30, radius 8):

| Tile | Light | Dark |
|---|---|---|
| Ear (Sound Alerts) | #1D9A8A | #6FD6C4 |
| Bell (Notifications) | #E5442C | #FF9C7A |
| Lock (Privacy) | #4C6EA8 | #8DB8FF |
| Type (Text & Display) | #6E6E73 | #C7C7CC |
| Help | #1A8A3C | #E4DECF |

Contact avatars (initial in a circle): gold gradient, light #F7D37E to #BF8C2E, dark #E4DECF to #958D7C, text #1A1A1C (light) / #14100A (dark).

## 4. Typography

- **Font:** Inter (via `google_fonts`). Design reference also lists SF Pro on iOS; on Android always use Inter.
- Letter spacing: -0.011em body, -0.03em on large titles.

| Style | Size / weight | Use |
|---|---|---|
| Large title | 34 / 700, line height 1.1 | Screen titles (Chats, Calls, Signs...) |
| Onboarding title | 32 / 700 | Onboarding headings |
| Section / name | 20 / 700 | Profile name, call name |
| Body | 16 / 400 to 600 | Messages, list rows, chat names |
| Subtext | 16, line height 1.4, `sec` colour | Descriptions under titles |
| Chip / button label | 14 / 600 | Chips, small buttons |
| Tab label | 10 / 600 | Bottom navigation |
| OTP digit | 26 / 700 | Verify code boxes |

## 5. Shape, Size and Spacing

Design frame: **390 x 844** (scale to the device; use `MediaQuery`, never fixed pixel widths).

| Element | Spec |
|---|---|
| Screen horizontal padding | 16 to 24 |
| Message bubble | max width 272, padding 9 x 14, radius 20, tail corner radius 6 (bottom-left incoming, bottom-right outgoing), 16 px text |
| Glass icon button | 44 x 44, fully round |
| Chip | height 34, radius 17, padding 0 x 14, 14 / 600 |
| Grouped card | radius 20, rows 54 high, 16 left padding, 0.5 px separators |
| Bottom nav (floating glass) | 16 px side margin, 22 px bottom margin, height 70, radius 35 |
| Nav item | 64 x 56, radius 28, icon over 10 px label |
| OTP box | 48 x 60, radius 14 |
| Icon tile | 30 x 30, radius 8 |
| "Allow" pill | height 32, radius 16, `accentSoft` fill, `accent` text |
| Segmented control | padding 3, radius 14, buttons 38 high with radius 11 |
| Selected option | 2 px `accent` border + 4 px `accentSoft` halo |
| Avatar | circle, bold initial, inner top highlight |
| Minimum touch target | 44 x 44 |

Icons: line style, 1.75 px stroke, round caps and joins, colour follows text (`currentColor`).

## 6. Glassmorphism

Used for the floating bottom nav, glass icon buttons, call controls and OTP boxes on onboarding.

- Translucent gradient fill (light: white 72% to pale blue 42%; dark: white 17% to 5%)
- Background blur about 28 with saturation boost (`BackdropFilter`)
- Thin edge highlight border (light: accent at 16%, 1 px; dark: white 20%, 0.5 px)
- Soft shadow with inner top highlight

Rule: glass only on floating or overlay elements. Never on full list rows or big text areas.

## 7. Screens

### 7.1 Onboarding flow

| # | Screen | Key content |
|---|---|---|
| 0a | Splash (every normal launch) | Lafzi, "Lafzio", "Say it your way.", tap to skip |
| 0b | First-launch intro (about 3.5 s) | Lafzi flies in and waves, 4 feature lines, "Get started" / "I already have an account" |
| 1 | Get started | "What's your number?", country picker (Pakistan +92), "Send code" |
| 2 | Verify code | 6-digit OTP boxes, "Wrong number?", resend timer (0:24), "Verify" |
| 3 | Choose a theme | Live preview, Light / Dark / Auto, "Continue" |
| 4 | How do you communicate? | Two cards: "I'm deaf or mute" and "I hear and speak" (sets user type) |
| 5 | Your profile | Name, photo (camera / gallery), "Skip photo for now" |
| 6 | Choose your avatar | Six avatars: Nova, Remy, Kai, Juno, Sage, Milo |
| 7 | Permissions | Camera, Microphone, Notifications, Haptic alerts ("Try it") |
| 8 | All set | Summary (mode, number), "Open Lafzio", "Teach my first sign" |

Note: the onboarding file numbers screens 1 to 9 after the splash and intro; the order above is the build order.

### 7.2 Core app screens

Bottom tabs, in order: **Chats, Calls, Signs, Translate, Me**.

| Screen | Key content |
|---|---|
| Chats | Large title, Edit, search, rows with avatar, name, last message, time. Last message can be text, "Sign: ...", "Voice message", "Missed video call", "Sent a photo" |
| Conversation | Header with avatar and name, day label, bubbles, status ("Delivered"), voice bubble with duration, "Show as signs" action with sign chips under a message |
| Video call (low-bandwidth) | Timer, labelled avatars (the other person and "You"), "Low-bandwidth, skeleton view" badge, live caption "LIVE: SIGN TO TEXT", controls: Mute, Full video, Captions, End |
| Teach a sign | Word being taught, "Take 3 of 5", hand-visibility hint, "Looks like Lunch, 92% match. Keep both?" conflict prompt, Done |
| Translate | Segments: Speech to Sign / Sign to Text. "NOW SIGNING" word queue, letter-by-letter fingerspelling (A N Y A), "Heard just now" transcript |
| Me | Profile card, "Getting started" progress (2 of 5), My Signs (count), Sound Alerts, Notifications, Privacy & Security, Text & Display, Help & Tutorials |

## 8. Key Component Behaviour

- **Outgoing bubble:** vertical gradient `outA` to `outB`, `onAccent` text. **Incoming:** `bubbleIn`, `text` colour.
- **Show as signs (LFR-027):** row of static hand-sign images, one per letter or digit. Symbols, punctuation and emojis stay plain text (LFR-028). This uses images only, never the 3D avatar.
- **Ambiguous-sign pop-up (LFR-018, 019, 047):** appears only on the Deaf user's screen, no timeout, stays until a meaning is tapped. New signs queue behind it. On calls, the avatar keeps mirroring live signing while the pop-up is open.
- **Avatars (LFR-040):** each participant has a visually distinct avatar with their name beneath it. Avatars appear only in video calls and face-to-face mode, never in direct messages (LFR-041).
- **Pulse:** the `accent` glow pulse (about 2.6 s loop) marks the main call-to-action or a live state.

## 9. Haptics and Visual Alerts

Fixed patterns, not user-customisable (LFR-053 to 055). Every haptic has a visual backup.

| Event | Haptic | Visual |
|---|---|---|
| New message | Short, light | In-app cue / banner |
| Incoming call | Long, repeating until answered or declined | Full-screen call UI |
| Dangerous sound | Strong, urgent, clearly different from the other two | Banner or screen flash |

Danger sounds: sirens, fire/smoke alarms, glass breaking, car horns, screams.

## 10. Motion

- Splash: static for normal launches; animated only on first launch.
- Lafzi intro: fly-in, overshoot, wave, blink, glance (about 3.5 s). Always skippable.
- Theme change: colours cross-fade about 0.35 s.
- Floating mascot: gentle 4.5 s up-down float.
- **Reduced motion:** when the system setting is on, turn off all animations and transitions (`MediaQuery.disableAnimations`).

## 11. Accessibility

- Text contrast must meet WCAG AA in both themes.
- Visible focus state on every interactive element (3 px `accent` outline).
- Minimum touch target 44 x 44.
- Never use colour alone to carry meaning; add an icon or label.
- Respect the system font-size setting; layouts must not break at large text.
- Provide semantic labels for icon-only buttons.

## 12. Implementation Notes (Flutter)

- One shared widget per component above (`ChatBubble`, `GlassButton`, `GlassNavBar`, `GroupedCard`, `OtpBox`...) under `lib/shared/widgets/`. Do not rebuild a component inside a screen.
- Use `Theme.of(context)` and `context.colors` only; no direct `Color(0x...)` in screen code.
- Keep UI widgets free of business logic (see `Rules.md`: UI, state and native bridges stay separate).
- 3D avatars use optimised GLB files with uniform bone names (see `Rules.md`).