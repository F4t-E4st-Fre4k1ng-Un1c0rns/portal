from typing import List
from functools import lru_cache
import uuid

from fastapi import HTTPException
from pydantic import TypeAdapter
import httpx
from sqlalchemy.sql.compiler import ResultColumnsEntry

from src.schemas.auth import UserSchema, UserProfileSchema, UserProfileListSchema
from src.settings import get_settings


class AuthService:
    scheme_url = get_settings().auth_service_url
    headers = {"Content-Type": "application/json"}

    async def get_user(self, id: uuid.UUID) -> UserProfileSchema:
        response = httpx.post(
            self.scheme_url + "/api/v1/auth/authenticateId",
            headers=self.headers,
            json={"id": str(id)},
        )
        if not response.is_success:
            raise HTTPException(status_code=500, detail="Auth serivce error")
        return UserProfileSchema.parse_raw(response.text)
    
    async def get_users_list(self, ids: list[uuid.UUID]) -> list[UserProfileSchema]:
        users = [{"id": str(id)} for id in ids]
        response = httpx.post(
            self.scheme_url + "/api/v1/auth/userList",
            headers=self.headers,
            json={"users": users,}
        )
        if not response.is_success:
            raise HTTPException(status_code=500, detail="Auth serivce error")
        print(response.text)
        return TypeAdapter(list[UserProfileSchema]).validate_json(response.text)

    async def authenticate(self, token: str) -> UserSchema:
        response = httpx.post(
            self.scheme_url + "/api/v1/auth/authenticateToken",
            headers=self.headers,
            json={"token": token},
        )
        if not response.is_success:
            raise HTTPException(status_code=500, detail="Auth serivce error")
        return UserSchema.parse_raw(response.text)


@lru_cache
def get_auth_service():
    return AuthService()
