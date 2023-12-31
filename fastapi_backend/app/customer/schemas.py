from typing import Optional, Generic, TypeVar
from pydantic import BaseModel , Field

T = TypeVar('T')

class CustomerSchema(BaseModel):
        id:Optional[int]=None
        name:Optional[str]=None
        address:Optional[str]=None
        phone:Optional[str]=None

        class Config:
            from_attribute = True

class Request(BaseModel, Generic[T]):
      parameter:Optional[T]=Field(...)

class RequestCustomer(BaseModel):
        parameter:CustomerSchema=Field(...)

class Response(BaseModel, Generic[T]):
        code: str
        status: str
        message: str
        result: Optional[T]