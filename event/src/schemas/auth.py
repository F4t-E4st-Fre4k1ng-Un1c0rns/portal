from datetime import datetime
import uuid

from pydantic import BaseModel


class UserProfileSchema(BaseModel):
    username: str
    email: str
    role: str
    isSponsor: str | None
    inn: str | None
    ogrn: str | None
    sponsorAdress: str | None
    name: str | None
    secondName: str | None
    fatherName: str | None
    city: str | None
    dateOfBirth: datetime | None
    club: str | None


class UserProfileSchemaId(UserProfileSchema):
    id: uuid.UUID


class UserSchema(BaseModel):
    id: uuid.UUID
