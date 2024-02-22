from typing import Optional
import uuid

from pydantic import BaseModel


class UserProfileSchema(BaseModel):
    username: str
    email: str
    role: str


class UserSchema(BaseModel):
    id: uuid.UUID


class UserListSchema(BaseModel):
    users: list[UserSchema]
