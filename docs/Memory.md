# Project Memory & Session State

## Current Status
- **Phase 0, Track A (App): code delivered, not yet compiled.** Run `flutter analyze` and `flutter test` after pasting.
- Done in code: theme tokens + typography, shared widgets, go_router with auth guard and 5-tab shell, domain contracts + mock repositories, Riverpod composition root.
- Real screens are NOT built yet. Every route currently shows `RoutePlaceholder`.
- Track B items (ml-engine env, FastAPI scaffold) are outside this file's scope and not tracked here yet.

## Key Decisions Made
- Android-only for v1. Cross-platform readiness is deferred and will be decided later only if time permits.
- Architecture avoids raw video streaming entirely. Normal calls are P2P WebRTC; low-bandwidth mode sends skeletal-coordinate JSON over Data Channels and the receiver drives the sender's avatar. Speech-to-sign uses lightweight sign tokens from `/text-to-sign` to drive the avatar locally.
- Privacy-first avatar builder: stylized procedural assets only (no photorealistic scans).
- Offline-capable local transcript export (date-stamped) for translation sessions (Phase 6). Whisper transcripts from the server are not stored.
- State management: Riverpod (`Notifier` API). Navigation: go_router with a pure, unit-tested redirect (`resolveAuthRedirect`).
- Layering: presentation -> application -> domain -> data. Repositories are exposed as providers in `core/providers/repository_providers.dart` (composition root). Swap `Mock*` for real implementations there.
- Colours only via `context.colors` (`AppColors` ThemeExtension in `core/theme/app_theme.dart`). No `Color(0x...)` in screens or widgets. `AppColors.copyWith()` returns `this` (fixed palettes).
- Glass: `GlassSurface` = shadow + clip + `BackdropFilter(blur 28)` + gradient + border. Saturation boost and inset highlight from the HTML are not reproduced. Blur sigma may need tuning on low-end devices (Phase 6).
- Reduced motion honoured in `GlassNavBar` and theme cross-fade. Nav labels clamp text scale to 1.2 so the 10 px labels do not break.
- Icons are Material icons as stand-ins. Custom line icons (hand sign, 3D cube) from the HTML are to be added later (e.g. via `flutter_svg`).
- Dev default: `MockAuthRepository` starts as `signedIn` so the tab shell is visible. Use `AuthStatus.signedOut` to test the guard.

## Proposed Contracts (Track B must sign off)
- `LandmarkFrame` (`ts`, `hands[]` with `hand`, 21 `points{x,y,z}`, `angles[]`) in `features/recognition/domain/landmark_frame.dart`.
- `SignMatchResult` / `SignCandidate` (`word`, `confidence` 0..1, `isAmbiguous`) in `.../sign_candidate.dart`.
- `DangerSoundEvent` (`type` in siren | fire_alarm | glass_break | car_horn | scream, `confidence`, `ts`).
- `POST /transcribe` -> `{text, language}`. `POST /text-to-sign` `{text}` -> `{tokens:[{type: word|fingerspelling, value}]}`.
- `SkeletalPacket` (`v`=1, `sender`, `seq`, `ts`, `hands[]`) for the WebRTC Data Channel.
- `AvatarBones` naming: Hips, Spine, Chest, Neck, Head; per side Shoulder, UpperArm, LowerArm, Hand; fingers Thumb|Index|Middle|Ring|Pinky 1..3 (e.g. `LeftIndex2`).

## File Changes (this session)
- `lib/main.dart`, `lib/app.dart`
- `lib/core/theme/app_theme.dart`, `app_typography.dart`
- `lib/core/errors/failure.dart`
- `lib/core/router/app_routes.dart`, `auth_guard.dart`, `app_router.dart`, `app_shell.dart`
- `lib/core/providers/repository_providers.dart`
- `lib/features/settings/{domain/theme_preference.dart, application/theme_providers.dart}`
- `lib/features/auth/{domain/auth_status.dart, domain/auth_repository.dart, data/mock_auth_repository.dart}`
- `lib/features/recognition/{domain/landmark_frame.dart, sign_candidate.dart, sign_recognition_repository.dart, data/mock_sign_recognition_repository.dart}`
- `lib/features/alerts/{domain/danger_sound_event.dart, danger_sound_repository.dart, data/mock_danger_sound_repository.dart}`
- `lib/features/translation/{domain/transcription_repository.dart, text_to_sign_repository.dart, data/mock_transcription_repository.dart, mock_text_to_sign_repository.dart}`
- `lib/features/calls/domain/skeletal_packet.dart`
- `lib/features/avatars/domain/avatar_bones.dart`
- `lib/shared/widgets/{focus_ring, glass_surface, glass_button, glass_nav_bar, chat_bubble, grouped_card (+IconTile), otp_box, route_placeholder}.dart`
- `test/core/router/auth_guard_test.dart`
- Dependencies added: `flutter_riverpod`, `go_router`, `google_fonts`. (`sqflite`, `supabase_flutter` come in Phase 1.)

## Known Blockers / Next Steps
- Verify Phase 0 compiles; fix any analyzer issues; confirm package name is `fyp_app`.
- Get Track B sign-off on the contracts above (field names, 21 points, 15 joint angles, token types).
- **Phase 1 (Track A):** static splash 0a, animated intro 0b (tap to skip, ~3.5 s), onboarding screens 1 to 9 + Login (replace `RoutePlaceholder`s); Supabase Auth, tables + RLS; local SQLite tables; persist theme preference.
- Resolve SQLite table naming before Phase 1: Architecture.md says `messages_cache` / `sign_synonyms`, Phases.md says `cached_messages` / `sign_words` / `sign_recordings`.
- Onboarding step numbering differs: Design.md lists screens 1 to 8, the onboarding HTML numbers them 1 to 9 after splash and intro. HTML wins per Design.md; confirm the final order.
- Pending decisions: FastAPI location (`ml-engine/` vs `backend/`) and hosting; WebRTC package and 3D avatar package (prototype before Phase 5); SMS provider for phone OTP; LFR-058 (danger detection on both devices or only the Deaf user's).
- Custom haptics remain deferred to the final polish phase, only if time permits. Fixed core haptics + visual cues follow Design.md section 9.