from sqlalchemy.orm import Session
from customer.models import Customer
from customer.schemas import CustomerSchema

def get_all(db: Session, skip: int = 0, limit: int = 100):
    return db.query(Customer).offset(skip).limit(limit).all()

def get_by_id(db: Session, id: int):
        return db.query(Customer).filter(Customer.id == id).first()

def create(db: Session, customer: CustomerSchema):
    db_customer = Customer(name=customer.name, address=customer.address, phone=customer.phone)
    db.add(db_customer)
    db.commit()
    db.refresh(db_customer)
    return db_customer

def update(db: Session, id: int, customer: CustomerSchema):
                    db_customer = db.query(Customer).filter(Customer.id == id).first()
                    db_customer.name = customer.name
                    db_customer.address = customer.address
                    db_customer.phone = customer.phone
                    db.commit()
                    db.refresh(db_customer)
                    return db_customer

def delete(db: Session, id: int):
                    db_customer = db.query(Customer).filter(Customer.id == id).first()
                    db.delete(db_customer)
                    db.commit()
                    return db_customer
