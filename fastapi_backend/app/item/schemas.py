from typing import Optional, Generic, TypeVar
from pydantic import BaseModel , Field

T = TypeVar('T')

class ItemSchema(BaseModel):
        i_code:Optional[int]=None
        description:Optional[str]=None
        unitPrice:Optional[str]=None
        qtyOnHand:Optional[str]=None

        class Config:
            from_attribute = True

class Request(BaseModel, Generic[T]):
      parameter:Optional[T]=Field(...)

class RequestItem(BaseModel):
        parameter:ItemSchema=Field(...)

class Response(BaseModel, Generic[T]):
        code: str
        status: str
        message: str
        result: Optional[T]