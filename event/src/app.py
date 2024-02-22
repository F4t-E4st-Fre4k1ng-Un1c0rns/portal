from fastapi import FastAPI

from src.api.v1.router import v1_router

app = FastAPI(
    title="event-service",
)

app.include_router(v1_router)
