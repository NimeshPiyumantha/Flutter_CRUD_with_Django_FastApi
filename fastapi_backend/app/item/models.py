from sqlalchemy import  Column, Integer, String
from config import Base

class Item(Base):
   __tablename__ = 'items'

   code = Column(Integer, primary_key=True, index=True)
   description = Column(String)
   unitPrice = Column(String)
   qtyOnHand = Column(String)