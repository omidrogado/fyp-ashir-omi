from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from routers import transcribe, sign_mapping

app = FastAPI(
    title="Lafzio ML & Assistant Backend",
    description="FastAPI service for voice transcription (Whisper) and text-to-sign token mapping.",
    version="1.0.0"
)

# CORS Middleware for local development and app clients
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Include Routers
app.include_router(transcribe.router, prefix="/api/v1", tags=["Transcription"])
app.include_router(sign_mapping.router, prefix="/api/v1", tags=["Sign Mapping"])

@app.get("/health", tags=["Health"])
async def health_check():
    return {"status": "ok", "service": "Lafzio Backend"}
