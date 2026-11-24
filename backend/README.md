# Lafzio Backend Service

FastAPI-powered backend service for Lafzio:
- **Audio Transcription:** Whisper-based speech-to-text pipeline for incoming voice messages.
- **Sign Mapping:** Text-to-sign token parsing and animation sequence retargeting.

## Quickstart

1. Create a virtual environment:
   ```bash
   python -m venv venv
   source venv/bin/activate  # Windows: venv\Scripts\activate
   ```
2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
3. Run the development server:
   ```bash
   uvicorn main:app --reload --port 8000
   ```
4. Access interactive API docs at `http://localhost:8000/docs`.
