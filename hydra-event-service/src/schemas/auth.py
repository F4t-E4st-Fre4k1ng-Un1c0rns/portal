from typing import Optional
from datetime import datetime
import uuid

from pydantic import BaseModel, RootModel


class UserProfileSchema(BaseModel):
    username: str
    email: str
    role: str
    isSponsor: bool | None = None 
    inn: str | None = None
    ogrn: str | None = None
    sponsorAdress: str | None = None
    name: str | None = None
    secondName: str | None = None
    fatherName: str | None = None
    city: str | None = None
    dateOfBirth: datetime | None = None
    club: str | None = None


class UserProfileSchema2(UserProfileSchema):
    id: uuid.UUID


class UserSchema(BaseModel):
    id: uuid.UUID

class UserProfileListSchema(RootModel):
    root: list[UserProfileSchema]
