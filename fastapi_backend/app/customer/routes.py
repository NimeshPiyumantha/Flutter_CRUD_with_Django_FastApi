from fastapi import APIRouter,HTTPException
from fastapi import Depends
from config import SessionLocal
from sqlalchemy.orm import Session
from customer.schemas import Response, RequestCustomer

import customer.crud

routerCustomer = APIRouter()

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

@routerCustomer.post("/customers")
async def create_customer_services(request: RequestCustomer, db: Session = Depends(get_db)):
    try:
        created_customer = customer.crud.create(db, customer=request.parameter)
        return create_response("Ok", "200", "Customer created successfully", created_customer)
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@routerCustomer.get("/customers")
async def get_all_customer_services(db: Session = Depends(get_db)):
    try:
        customers = customer.crud.get_all(db)
        return create_response("Ok", "200", "Customers retrieved successfully", customers)
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@routerCustomer.get("/customers/{id}")
async def get_customer_by_id_services(id: int, db: Session = Depends(get_db)):
    try:
        customer_data = customer.crud.get_by_id(db, id)  # Assuming 'crud' is the module or object containing your CRUD operations
        if customer_data is None:
            raise HTTPException(status_code=404, detail="Customer not found")

        return create_response("Ok", "200", "Customer retrieved successfully", customer_data)
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@routerCustomer.put("/customers")
async def update_customer_services(request: RequestCustomer, db: Session = Depends(get_db)):
    try:
        updated_customer = customer.crud.update(db, id=request.parameter.id, customer=request.parameter)
        if updated_customer is None:
            raise HTTPException(status_code=404, detail="Customer not found")
        return create_response("Ok", "200", "Customer updated successfully", updated_customer)
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@routerCustomer.delete("/customers/{id}")
async def delete_customer_services(id: int, db: Session = Depends(get_db)):
    try:
        deleted_customer = customer.crud.delete(db, id)
        if deleted_customer is None:
            raise HTTPException(status_code=404, detail="Customer not found")
        return create_response("Ok", "200", "Customer deleted successfully", deleted_customer)
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))