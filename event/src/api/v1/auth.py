from uuid import UUID
from fastapi import APIRouter
from src.service.auth import get_auth_service


auth_router = APIRouter(
    prefix="/auth",
)


@auth_router.get("/get_user_data")
async def listevents(user_id: UUID):
    return await get_auth_service().get_user(user_id)


@auth_router.get("/verify")
async def get_event(token: str):
    return await get_auth_service().authenticate(token)
