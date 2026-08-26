# Project Memory & Session State

## Current Status


## Key Decisions Made
- Architecture avoids raw video streaming entirely; uses local avatar animation driven by transmitted lightweight text tokens.
- Privacy-first avatar builder: Stylized procedural assets only (no photorealistic scans).
- Offline-capable local transcript generation for all translation sessions.

## Known Blockers / Next Steps
- Implement platform-specific bridges for MediaPipe across desktop and mobile.