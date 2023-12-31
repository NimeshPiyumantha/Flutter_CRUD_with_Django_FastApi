from fastapi import APIRouter,HTTPException
from fastapi import Depends
from config import SessionLocal
from sqlalchemy.orm import Session
from item.schemas import Response, RequestItem

import item.crud

routerItem = APIRouter()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

def create_response(status: str, code: str, message: str, result=None):
    return {
        "status": status,
        "code": code,
        "message": message,
        "result": result
    }

@routerItem.get("/items")
async def get_all_item_services(db: Session = Depends(get_db)):
    try:
        items = item.crud.get_all(db)
        return create_response("Ok", "200", "Items retrieved successfully", items)
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@routerItem.get("/items/{i_code}")
async def get_item_service(i_code: int, db: Session = Depends(get_db)):
    try:
        item = item.crud.get_by_code(db, i_code)
        if item is None:
            raise HTTPException(status_code=404, detail="Item not found")
        return create_response("Ok", "200", "Item retrieved successfully", item)
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@routerItem.post("/items")
async def create_item_service(request: RequestItem, db: Session = Depends(get_db)):
      try:
        created_item = item.crud.create(db, item=request.parameter)
        return create_response("Ok", "200", "Item created successfully", created_item)
      except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@routerItem.put("/items")
async def update_item_service(request: RequestItem, db: Session = Depends(get_db)):
    try:
        updated_item = item.crud.update(db, i_code=request.parameter.i_code, item=request.parameter)
        if updated_item is None:
            raise HTTPException(status_code=404, detail="Item not found")
        return create_response("Ok", "200", "Item updated successfully", updated_item)
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@routerItem.delete("/items/{i_code}")
async def delete_item_service(i_code: int, db: Session = Depends(get_db)):
    try:
        deleted_item = item.crud.delete(db, i_code)
        if deleted_item is None:
            raise HTTPException(status_code=404, detail="Item not found")
        return create_response("Ok", "200", "Item deleted successfully", deleted_item)
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))