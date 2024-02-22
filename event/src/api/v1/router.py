from fastapi import APIRouter

from src.api.v1.events import events_router
from src.api.v1.auth import auth_router

v1_router = APIRouter(
    prefix="/api/v1",
)

v1_router.include_router(events_router)
v1_router.include_router(auth_router)
