from fastapi import FastAPI

from src.api.router import main_router

app = FastAPI(
    title="ghidra-event-service",
)

app.include_router(main_router)
