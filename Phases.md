# Development Phases & Roadmap

- [ ] **Phase 1: Project Setup & Core Models**
  - Scaffold Flutter project across mobile and desktop targets.
  - Define data structures (Tokens, Messages, GestureLandmarks, AvatarConfigs).
  - Setup local SQLite storage for settings and transcripts.

- [ ] **Phase 2: 3D Avatar Rendering Engine**
  - Integrate 3D viewport widget for glTF/GLB rendering.
  - Implement skeletal animation queue for PSL sign gestures.
  - Implement viseme/blendshape morph targets for talking lip-sync.

- [ ] **Phase 3: PSL Translation Pipelines**
  - Build MediaPipe integration isolate for landmark extraction.
  - Implement gesture matching and PSL dictionary lookup.
  - Hook Speech-to-Text and Text-to-Speech engines.

- [ ] **Phase 4: Custom PSL Keyboard & Messaging**
  - Design custom visual sign grid input.
  - Implement bidirectional text chat with transcript export logic.

- [ ] **Phase 5: Conflict-Free Avatar Live Calling**
  - Setup lightweight real-time communication channel for token syncing.
  - Synchronize dual avatar rendering during live call sessions.

- [ ] **Phase 6: Testing, Polish & Optimization**
  - Profiling memory footprint of 3D models on low-end hardware.
  - End-to-end latency benchmarks and accessibility audits.