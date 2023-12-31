import os
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

# Retrieve DATABASE_URL from environment variables
# DATABASE_URL = os.getenv("DATABASE_URL")

DATABASE_URL = "postgresql://postgres:1234@localhost:5432/mobile_pos2"

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()
