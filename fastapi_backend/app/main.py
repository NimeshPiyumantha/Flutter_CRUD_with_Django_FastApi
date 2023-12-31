from fastapi import FastAPI
import customer.models
from customer.routes import router
from config import engine

customer.models.Base.metadata.create_all(bind=engine)

app = FastAPI()

app.include_router(router, prefix="/api/v1", tags=["customers"])
