# Lafzio (fyp-ashir-omi)

**Lafzio** — "Say it your way."
An assistive chat and video-calling application bridging the communication gap between Deaf / hard-of-hearing users and hearing individuals through on-device sign language recognition, 3D avatar animation, speech-to-sign translations, and background danger sound alerts.

---

## Project Structure

```
fyp-ashir-omi/
├── assets/                            # Shared design assets (icons, hand-sign images, avatars, .glb)
│   ├── signs/
│   ├── avatars/
│   └── icons/
├── fyp_app/                           # Flutter Android application
│   ├── lib/
│   │   ├── main.dart
│   │   ├── app.dart                   # MaterialApp.router, theme mode
│   │   ├── core/
│   │   │   ├── theme/
│   │   │   │   └── app_theme.dart     # Design tokens (light & dark)
│   │   │   ├── router/
│   │   │   │   └── app_router.dart    # go_router + auth redirects
│   │   │   ├── config/
│   │   │   │   └── app_config.dart    # Supabase & FastAPI env settings
│   │   │   ├── errors/
│   │   │   │   └── failures.dart      # Failure types & user-facing error messages
│   │   │   ├── database/
│   │   │   │   └── app_database.dart  # sqflite setup & migrations
│   │   │   └── utils/
│   │   │       └── validators.dart
│   │   ├── shared/
│   │   │   └── widgets/
│   │   │       ├── chat_bubble.dart
│   │   │       ├── glass_button.dart
│   │   │       ├── glass_nav_bar.dart
│   │   │       ├── grouped_card.dart
│   │   │       └── otp_box.dart
│   │   ├── features/
│   │   │   ├── onboarding/
│   │   │   │   ├── presentation/
│   │   │   │   │   ├── screens/
│   │   │   │   │   │   ├── splash_screen.dart
│   │   │   │   │   │   ├── intro_screen.dart
│   │   │   │   │   │   ├── phone_input_screen.dart
│   │   │   │   │   │   ├── otp_verify_screen.dart
│   │   │   │   │   │   ├── theme_selection_screen.dart
│   │   │   │   │   │   ├── user_type_screen.dart
│   │   │   │   │   │   ├── profile_setup_screen.dart
│   │   │   │   │   │   ├── avatar_selection_screen.dart
│   │   │   │   │   │   └── permissions_screen.dart
│   │   │   │   │   └── widgets/
│   │   │   │   ├── application/
│   │   │   │   ├── domain/
│   │   │   │   └── data/
│   │   │   ├── auth/
│   │   │   │   ├── presentation/
│   │   │   │   │   └── screens/
│   │   │   │   │       └── login_screen.dart
│   │   │   │   ├── application/
│   │   │   │   ├── domain/
│   │   │   │   └── data/
│   │   │   ├── chat/
│   │   │   │   ├── presentation/
│   │   │   │   │   ├── screens/
│   │   │   │   │   │   ├── chat_list_screen.dart
│   │   │   │   │   │   ├── conversation_screen.dart
│   │   │   │   │   │   ├── new_chat_screen.dart
│   │   │   │   │   │   └── contact_info_screen.dart
│   │   │   │   │   └── widgets/
│   │   │   │   ├── application/
│   │   │   │   ├── domain/
│   │   │   │   └── data/
│   │   │   ├── recognition/
│   │   │   │   ├── presentation/
│   │   │   │   │   ├── screens/
│   │   │   │   │   │   └── sign_camera_screen.dart
│   │   │   │   │   └── widgets/
│   │   │   │   │       └── ambiguity_popup.dart
│   │   │   │   ├── application/
│   │   │   │   ├── domain/
│   │   │   │   └── data/
│   │   │   ├── custom_signs/
│   │   │   │   ├── presentation/
│   │   │   │   │   ├── screens/
│   │   │   │   │   │   ├── custom_dictionary_screen.dart
│   │   │   │   │   │   ├── record_sign_screen.dart
│   │   │   │   │   │   ├── verify_sign_screen.dart
│   │   │   │   │   │   └── sign_detail_screen.dart
│   │   │   │   │   └── widgets/
│   │   │   │   ├── application/
│   │   │   │   ├── domain/
│   │   │   │   └── data/
│   │   │   ├── translation/
│   │   │   │   ├── presentation/
│   │   │   │   │   ├── screens/
│   │   │   │   │   │   ├── text_to_sign_screen.dart
│   │   │   │   │   │   └── speech_to_sign_screen.dart
│   │   │   │   │   └── widgets/
│   │   │   │   │       └── sign_keyboard_widget.dart
│   │   │   │   ├── application/
│   │   │   │   ├── domain/
│   │   │   │   └── data/
│   │   │   ├── avatars/
│   │   │   │   ├── presentation/
│   │   │   │   │   ├── screens/
│   │   │   │   │   │   └── avatar_preview_screen.dart
│   │   │   │   │   └── widgets/
│   │   │   │   ├── application/
│   │   │   │   ├── domain/
│   │   │   │   └── data/
│   │   │   ├── calls/
│   │   │   │   ├── presentation/
│   │   │   │   │   ├── screens/
│   │   │   │   │   │   ├── call_history_screen.dart
│   │   │   │   │   │   ├── incoming_call_screen.dart
│   │   │   │   │   │   ├── outgoing_call_screen.dart
│   │   │   │   │   │   └── active_call_screen.dart
│   │   │   │   │   └── widgets/
│   │   │   │   ├── application/
│   │   │   │   ├── domain/
│   │   │   │   └── data/
│   │   │   ├── alerts/
│   │   │   │   ├── presentation/
│   │   │   │   │   ├── screens/
│   │   │   │   │   │   └── danger_alerts_log_screen.dart
│   │   │   │   │   └── widgets/
│   │   │   │   │       └── danger_alert_banner.dart
│   │   │   │   ├── application/
│   │   │   │   ├── domain/
│   │   │   │   └── data/
│   │   │   ├── face_to_face/
│   │   │   │   ├── presentation/
│   │   │   │   │   ├── screens/
│   │   │   │   │   │   └── face_to_face_screen.dart
│   │   │   │   │   └── widgets/
│   │   │   │   ├── application/
│   │   │   │   ├── domain/
│   │   │   │   └── data/
│   │   │   ├── help/
│   │   │   │   ├── presentation/
│   │   │   │   │   ├── screens/
│   │   │   │   │   │   ├── help_center_screen.dart
│   │   │   │   │   │   └── submit_complaint_screen.dart
│   │   │   │   │   └── widgets/
│   │   │   │   ├── application/
│   │   │   │   ├── domain/
│   │   │   │   └── data/
│   │   │   └── settings/
│   │   │       ├── presentation/
│   │   │       │   ├── screens/
│   │   │       │   │   ├── settings_screen.dart
│   │   │       │   │   ├── edit_profile_screen.dart
│   │   │       │   │   ├── change_avatar_screen.dart
│   │   │       │   │   ├── language_speech_settings_screen.dart
│   │   │       │   │   └── danger_detection_settings_screen.dart
│   │   │       │   └── widgets/
│   │   │       ├── application/
│   │   │       ├── domain/
│   │   │       └── data/
│   │   └── platform/                  # Dart side of native bridges
│   │       ├── mediapipe_channel.dart
│   │       └── yamnet_channel.dart
│   ├── android/                       # Native Kotlin code for MediaPipe & YAMNet bridges
│   └── test/                          # Unit & widget tests
├── ml-engine/                         # Python workspace (DTW tuning, landmark testing, Whisper/token tests)
├── Architecture.md
├── Design.md
├── Memory.md
├── PRD.md
├── Phases.md
├── README.md
└── Rules.md
```

---

## Architectural & Design Documentation

- **[Architecture.md](Architecture.md)**: System architecture, hybrid device-cloud boundary, 9 modules, state management, SQLite schema, WebRTC protocols.
- **[Design.md](Design.md)**: Color tokens (`AppColors`), typography, component styling, light and dark themes.
- **[Rules.md](Rules.md)**: AI guardrails, strict typing, threading constraints, offline-first principles.
- **[PRD.md](PRD.md)** & **[Phases.md](Phases.md)**: Requirements, timeline, milestone deliverables.
