# System Architecture & Tech Stack (Accourding to Ai needs further research)

## 1. Tech Stack
- **Framework:** Flutter (Single codebase targeting Android, iOS, Windows, macOS, Linux).
- **Computer Vision / Pose Detection:** Google MediaPipe (Hand & Holistic tracking via platform channels / FFI).
- **3D Avatar Engine:** Three.js via Webview / Flutter 3D Controller (glTF/GLB models, skeletal morph targets, blendshapes).
- **Speech Pipeline:** Speech-to-Text (Local Whisper / Platform STT) & Text-to-Speech (Flutter TTS / Piper).
- **Real-Time Data Layer:** Supabase Realtime / WebSocket cluster for lightweight token-based call signaling.
- **Local Storage:** SQLite (via drift / sqflite) & local path provider for exported text transcripts.

## 2. Directory Structure (Not final further files and sub folders need to be made)
lib/
├── core/
│   ├── constants/
│   ├── network/
│   └── utils/
├── features/
│   ├── avatar/             # 3D renderer, glTF loaders, blendshapes, customization
│   ├── keyboard/           # PSL sign keyboard grid & text input controller
│   ├── psl_to_voice/       # MediaPipe pipelines, gesture classification, TTS & lip-sync
│   ├── voice_to_psl/       # Audio stream capture, STT engine, animation queue
│   ├── live_call/          # Lightweight token signalling, room management
│   └── transcript/         # Conversation logger & file exporter
├── shared_widgets/
└── main.dart


## 3. Data Flow
- **PSL -> Voice:** Camera -> MediaPipe Landmarks -> PSL Classification Engine -> Text Token -> Local TTS + Lip-sync Avatar -> (If in call: Send Token over Socket).
- **Voice -> PSL:** Audio In -> STT -> Text Token -> (If in call: Received over Socket) -> Sign Token Queue ->3D Avatar Skeletal Animation.