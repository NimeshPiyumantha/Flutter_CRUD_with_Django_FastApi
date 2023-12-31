from fastapi import FastAPI
import customer.models
import item.models
from customer.routes import routerCustomer
from item.routes import routerItem
from config import engine

customer.models.Base.metadata.create_all(bind=engine)
item.models.Base.metadata.create_all(bind=engine)

app = FastAPI()


app.include_router(routerItem, prefix="/api/v1", tags=["items"])
app.include_router(routerCustomer, prefix="/api/v1", tags=["customers"])