from sqlalchemy.orm import Session
from item.models import Item
from item.schemas import ItemSchema

def get_all(db: Session, skip: int = 0, limit: int = 100):
    return db.query(Item).offset(skip).limit(limit).all()

def get_by_code(db: Session, i_code: int):
        return db.query(Item).filter(Item.i_code == i_code).first()

def create(db: Session, item: ItemSchema):
        db_item = Item(i_code=item.i_code, description=item.description, unitPrice=item.unitPrice, qtyOnHand=item.qtyOnHand)
        db.add(db_item)
        db.commit()
        db.refresh(db_item)
        return db_item

def update(db: Session, i_code: int, item: ItemSchema):
                    db_item = db.query(Item).filter(Item.i_code == i_code).first()
                    db_item.description = item.description
                    db_item.unitPrice = item.unitPrice
                    db_item.qtyOnHand = item.qtyOnHand
                    db.commit()
                    db.refresh(db_item)
                    return db_item

def delete(db: Session, i_code: int):
                    db_item = db.query(Item).filter(Item.i_code == i_code).first()
                    db.delete(db_item)
                    db.commit()
                    return db_item