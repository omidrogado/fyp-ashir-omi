# Lafzio (fyp-ashir-omi)

**Lafzio** — "Say it your way."
An assistive chat and video-calling application bridging the communication gap between Deaf / hard-of-hearing users and hearing individuals through on-device sign language recognition, 3D avatar animation, speech-to-sign translations, and background danger sound alerts.

---

## Project Structure

```
fyp-ashir-omi/
├── assets/
│   ├── avatars/                  # .glb 3D avatar models
│   ├── sign_animations/          # pre-baked sign animation .glb
│   ├── sign_images/              # A-Z aur digits ke static hand-sign images
│   ├── models/                   # yamnet.tflite, hand_landmarker.task
│   ├── sounds/
│   ├── icons/
│   └── fonts/
│
├── fyp_app/
│   ├── pubspec.yaml
│   ├── android/
│   ├── test/
│   └── lib/
│       ├── main.dart ⭐
│       ├── app.dart ⭐                     # MaterialApp, theme, router
│       │
│       ├── core/
│       │   ├── constants/
│       │   │   ├── app_colors.dart ⭐
│       │   │   ├── app_strings.dart
│       │   │   ├── app_routes.dart ⭐
│       │   │   └── haptic_patterns.dart ⭐
│       │   ├── theme/
│       │   │   ├── app_theme.dart ⭐
│       │   │   └── app_text_styles.dart ⭐
│       │   ├── router/
│       │   │   └── app_router.dart ⭐
│       │   ├── utils/
│       │   │   ├── permission_helper.dart ⭐
│       │   │   ├── validators.dart
│       │   │   └── date_formatter.dart
│       │   ├── errors/
│       │   │   └── failures.dart
│       │   └── widgets/                    # shared widgets
│       │       ├── primary_button.dart ⭐
│       │       ├── app_text_field.dart ⭐
│       │       ├── app_bottom_nav.dart ⭐
│       │       ├── avatar_circle.dart
│       │       ├── loading_overlay.dart
│       │       └── empty_state.dart
│       │
│       ├── native_bridge/                  # sirf platform/plugin wrappers
│       │   ├── audio_input_service.dart ⭐  # mic stream
│       │   ├── haptic_service.dart ⭐       # vibration patterns
│       │   ├── notification_service.dart ⭐
│       │   ├── camera_service.dart
│       │   └── speech_recognizer_service.dart
│       │
│       ├── data/
│       │   ├── local/
│       │   │   ├── database_helper.dart    # sqflite setup
│       │   │   ├── chat_dao.dart
│       │   │   ├── sign_dao.dart
│       │   │   └── alert_history_dao.dart ⭐
│       │   ├── remote/
│       │   │   ├── supabase_client.dart
│       │   │   └── fastapi_client.dart
│       │   └── models/
│       │       ├── app_user.dart
│       │       ├── message.dart
│       │       ├── chat_thread.dart
│       │       ├── call_record.dart
│       │       ├── custom_sign.dart
│       │       ├── help_request.dart
│       │       └── danger_alert.dart ⭐
│       │
│       └── features/
│           ├── onboarding/ ⭐
│           │   ├── screens/
│           │   │   ├── splash_screen.dart
│           │   │   ├── welcome_screen.dart
│           │   │   ├── intro_slides_screen.dart
│           │   │   ├── role_selection_screen.dart
│           │   │   └── permissions_screen.dart
│           │   ├── widgets/
│           │   └── providers/onboarding_provider.dart
│           │
│           ├── auth/
│           │   ├── screens/
│           │   │   ├── register_screen.dart
│           │   │   ├── login_screen.dart
│           │   │   └── otp_screen.dart
│           │   ├── repository/auth_repository.dart
│           │   └── providers/auth_provider.dart
│           │
│           ├── profile/                    # "Me" tab
│           │   ├── screens/
│           │   │   ├── me_screen.dart ⭐
│           │   │   ├── edit_profile_screen.dart
│           │   │   ├── notifications_settings_screen.dart
│           │   │   ├── privacy_security_screen.dart
│           │   │   └── text_display_screen.dart
│           │   └── providers/profile_provider.dart
│           │
│           ├── chat/
│           │   ├── screens/
│           │   │   ├── chats_list_screen.dart ⭐ (UI shell)
│           │   │   ├── conversation_screen.dart ⭐ (UI shell)
│           │   │   ├── new_chat_screen.dart
│           │   │   └── user_discovery_screen.dart
│           │   ├── widgets/
│           │   │   ├── message_bubble.dart
│           │   │   ├── voice_message_bubble.dart
│           │   │   ├── sign_row_view.dart
│           │   │   ├── chat_input_bar.dart
│           │   │   └── lafzio_keyboard.dart
│           │   ├── repository/chat_repository.dart
│           │   └── providers/chat_provider.dart
│           │
│           ├── voice_message/
│           │   ├── screens/transcript_view_screen.dart
│           │   ├── services/voice_recorder_service.dart
│           │   └── providers/voice_message_provider.dart
│           │
│           ├── sign_recognition/
│           │   ├── screens/sign_to_text_screen.dart
│           │   ├── widgets/
│           │   │   ├── camera_preview_panel.dart
│           │   │   ├── hand_overlay_painter.dart
│           │   │   └── ambiguous_sign_popup.dart
│           │   ├── services/
│           │   │   ├── landmark_extractor.dart   # isolate mein
│           │   │   ├── dtw_matcher.dart
│           │   │   └── sign_isolate.dart
│           │   └── providers/recognition_provider.dart
│           │
│           ├── custom_signs/
│           │   ├── screens/
│           │   │   ├── my_signs_screen.dart
│           │   │   ├── teach_sign_screen.dart
│           │   │   └── sign_conflict_screen.dart
│           │   ├── widgets/take_counter.dart
│           │   └── providers/custom_sign_provider.dart
│           │
│           ├── translation/
│           │   ├── screens/
│           │   │   ├── translate_screen.dart
│           │   │   └── text_to_sign_sheet.dart
│           │   ├── widgets/
│           │   │   ├── avatar_view.dart
│           │   │   ├── fingerspelling_row.dart
│           │   │   └── hold_to_speak_button.dart
│           │   ├── services/
│           │   │   ├── sign_mapper.dart
│           │   │   └── avatar_controller.dart
│           │   └── providers/translation_provider.dart
│           │
│           ├── calling/
│           │   ├── screens/
│           │   │   ├── calls_history_screen.dart
│           │   │   ├── incoming_call_screen.dart
│           │   │   ├── outgoing_call_screen.dart
│           │   │   └── video_call_screen.dart
│           │   ├── widgets/
│           │   │   ├── call_controls.dart
│           │   │   ├── live_caption_bar.dart
│           │   │   └── dual_avatar_view.dart
│           │   ├── services/
│           │   │   ├── webrtc_service.dart
│           │   │   ├── signaling_service.dart
│           │   │   └── skeleton_data_channel.dart  # low-bandwidth JSON
│           │   └── providers/call_provider.dart
│           │
│           ├── face_to_face/
│           │   ├── screens/face_to_face_screen.dart
│           │   └── providers/face_to_face_provider.dart
│           │
│           ├── sound_alerts/ ⭐                # is hafte ka main feature
│           │   ├── screens/
│           │   │   ├── sound_alerts_screen.dart       # toggle + sounds list + listening indicator
│           │   │   ├── danger_alert_screen.dart       # full-screen red alert
│           │   │   └── alert_history_screen.dart
│           │   ├── widgets/
│           │   │   ├── listening_indicator.dart
│           │   │   ├── sound_type_tile.dart
│           │   │   └── alert_history_tile.dart
│           │   ├── services/
│           │   │   ├── yamnet_classifier.dart         # TFLite inference
│           │   │   ├── danger_detector.dart           # threshold + consecutive frames
│           │   │   └── detection_isolate.dart
│           │   └── providers/
│           │       ├── sound_alerts_provider.dart
│           │       └── alert_history_provider.dart
│           │
│           └── help/
│               ├── screens/
│               │   ├── help_screen.dart
│               │   ├── submit_request_screen.dart
│               │   └── tutorials_screen.dart
│               └── providers/help_provider.dart
│
├── ml-engine/
│   ├── sign_dictionary/              # base signs ka data
│   ├── scripts/                      # model convert / export scripts
│   └── README.md
│
├── backend/                          # FastAPI server
│   ├── main.py
│   ├── routers/
│   │   ├── transcribe.py             # Whisper
│   │   └── sign_mapping.py           # text -> sign tokens
│   ├── services/
│   ├── requirements.txt
│   └── README.md
│
└── docs/
    ├── Architecture.md
    ├── Design.md
    ├── Memory.md
    ├── Phases.md
    ├── PRD.md
    ├── Rules.md
    └── README.md
```

---

## Architectural & Design Documentation

Documentation lives inside the [`docs/`](docs/) directory:
- **[docs/Architecture.md](docs/Architecture.md)**: System architecture, hybrid device-cloud boundary, Riverpod state, SQLite schema, WebRTC protocols.
- **[docs/Design.md](docs/Design.md)**: UI tokens, typography, component styling, light and dark themes.
- **[docs/Rules.md](docs/Rules.md)**: AI guardrails, strict typing, threading constraints, offline-first principles.
- **[docs/PRD.md](docs/PRD.md)** & **[docs/Phases.md](docs/Phases.md)**: Product requirements, milestones, weekly development phases.
