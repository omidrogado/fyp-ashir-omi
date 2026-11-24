# Coding Standards & AI Guardrails

## 1. Architectural Rules
- Strict separation between UI, state management, and native platform channel bridges.
- Never send raw camera frames to any server. Video calls are peer-to-peer via WebRTC only; in low-bandwidth mode, send only skeletal-coordinate JSON over Data Channels instead of video.
- Keep ML model inference and MediaPipe frame processing off the main UI thread (use Background Isolates / Workers).

## 2. Code Quality & Formatting
- **State Management:** Use consistent, testable state containers (e.g., Riverpod or Bloc).
- **3D Assets:** All 3D models must be optimized glTF/GLB formats with compressed textures and uniform bone naming conventions.
- **Type Safety:** No untyped `dynamic` variables. Explicit typing and null-safety required everywhere.
- **Error Handling:** Graceful fallback for low-light camera conditions, STT misrecognitions, and network reconnects.