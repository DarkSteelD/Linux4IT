from fastapi import FastAPI, HTTPException
from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

DATABASE_URL = "postgresql://user:password@localhost/dbname"

# Настройка подключения к базе данных
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()

# Модель таблицы
class Item(Base):
    __tablename__ = "items"
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, index=True)
    description = Column(String)

# Инициализация FastAPI
app = FastAPI()

# Создание таблиц
Base.metadata.create_all(bind=engine)

# Эндпоинт для получения всех элементов
@app.get("/items/")
def read_items():
    session = SessionLocal()
    items = session.query(Item).all()
    session.close()
    return items

# Эндпоинт для создания элемента
@app.post("/items/")
def create_item(name: str, description: str):
    session = SessionLocal()
    new_item = Item(name=name, description=description)
    session.add(new_item)
    session.commit()
    session.refresh(new_item)
    session.close()
    return new_item
