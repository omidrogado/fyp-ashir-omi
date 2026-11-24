# Product Requirements Document (PRD)

## 1. Project Overview
A cross-platform (mobile, laptop, PC) application enabling bi-directional communication between Pakistani Sign Language (PSL) users and hearing/speaking individuals using low-latency, lightweight data transmission instead of heavy video streams.

## 2. Target Audience
- Deaf and hard-of-hearing individuals communicating in Pakistani Sign Language (PSL).
- Hearing individuals needing real-time voice translation to/from sign language.

## 3. Core Feature Requirements
- **PSL to Voice Translation:** Track physical hand/body gestures via skeletal landmark mapping, translate them into text, synthesize spoken audio, and display a locally rendered 3D avatar with lip-synced speech animation.
- **Voice to PSL Translation:** Transcribe live spoken audio to text, parse grammatical/lexical tokens, and trigger pre-mapped 3D avatar sign animations on the recipient's screen.
- **Privacy-Preserving 3D Avatars (If possible):** Modular, stylized customizable 3D avatar builder (clothing, hair, accessories) explicitly avoiding 1:1 facial likeness replication.
- **Custom PSL Keyboard:** In-app virtual keyboard featuring a visual grid of PSL hand shapes/gestures for direct text messaging.
- **Conflict-Free Avatar Calling:** Peer-to-peer/cluster live call protocol transmitting only timestamped text/landmark tokens over lightweight real-time channels, rendering avatars locally to eliminate video bandwidth bottlenecks.
- **Local Transcript Logging:** Automated generation and export of date-stamped conversation logs directly to local device storage.

## 4. Train on local languages
- Train the model on local languages of Pakistan

## 5. Success Metrics
- Make the latency as low as possible
- Full offline functionality for local 1-on-1 translation and transcript saving.6