from functools import cached_property, lru_cache

from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    model_config = SettingsConfigDict(env_file=".env")

    POSTGRES_HOST: str
    POSTGRES_DB: str
    POSTGRES_USER: str
    POSTGRES_PASSWORD: str

    AUTH_SERVICE_URL: str

    FILE_STORAGE_PATH: str = "./media"

    @cached_property
    def postgres_url(self):
        return f"postgresql+asyncpg://{self.POSTGRES_USER}:{self.POSTGRES_PASSWORD}@{self.POSTGRES_HOST}/{self.POSTGRES_DB}"

    @cached_property
    def auth_service_url(self):
        return self.AUTH_SERVICE_URL


@lru_cache
def get_settings():
    return Settings()
