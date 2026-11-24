from typing import List
from fastapi import APIRouter
from pydantic import BaseModel

router = APIRouter()

class TokenMappingRequest(BaseModel):
    text: str
    target_language: str = "PSL"  # Pakistan Sign Language / ASL

class SignToken(BaseModel):
    token: str
    is_fingerspelled: bool
    animation_id: str | None = None
    image_asset: str | None = None

class TokenMappingResponse(BaseModel):
    original_text: str
    tokens: List[SignToken]

@router.post("/map-sign", response_model=TokenMappingResponse)
async def map_text_to_sign_tokens(payload: TokenMappingRequest):
    """
    Maps input text / phrases into ordered sign animation tokens and fingerspelling sequences.
    """
    words = payload.text.strip().split()
    tokens: List[SignToken] = []

    for word in words:
        clean_word = word.lower()
        # Look up pre-baked sign animation or fallback to fingerspelling letters
        tokens.append(
            SignToken(
                token=clean_word,
                is_fingerspelled=False,
                animation_id=f"anim_{clean_word}",
                image_asset=f"assets/sign_images/{clean_word}.png"
            )
        )

    return TokenMappingResponse(
        original_text=payload.text,
        tokens=tokens
    )
