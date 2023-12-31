from sqlalchemy import  Column, Integer, String
from config import Base

class Customer(Base):
   __tablename__ = 'customers'

   id = Column(Integer, primary_key=True, index=True)
   name = Column(String)
   address = Column(String)
   phone = Column(String)
