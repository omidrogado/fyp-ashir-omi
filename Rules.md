# Coding Standards & AI Guardrails

## 1. Architectural Rules
- Strict separation between UI, state management, and native platform channel bridges.
- Never transmit raw video/camera frames across the network. All call streaming must rely strictly on lightweight text tokens or skeletal coordinate payloads.
- Keep ML model inference and MediaPipe frame processing off the main UI thread (use Background Isolates / Workers).

## 2. Code Quality & Formatting
- **State Management:** Use consistent, testable state containers (e.g., Riverpod or Bloc).
- **3D Assets:** All 3D models must be optimized glTF/GLB formats with compressed textures and uniform bone naming conventions.
- **Type Safety:** No untyped `dynamic` variables. Explicit typing and null-safety required everywhere.
- **Error Handling:** Graceful fallback for low-light camera conditions, STT misrecognitions, and network reconnects.