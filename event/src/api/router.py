from fastapi import APIRouter

from src.api.v1.router import v1

main_router = APIRouter(
    prefix="/api",
)

main_router.include_router(v1)
