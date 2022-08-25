from sqlalchemy.orm import sessionmaker
import json
from models import create_tables, Publisher, Book, Stock, Shop, Sale
import sqlalchemy
import os


PG_LOGIN = os.getenv('PG_LOGIN')
PG_PASS = os.getenv('PG_PASS')
DB_NAME = os.getenv('DB_NAME')


if __name__ == "__main__":
    DSN = f'postgresql://{PG_LOGIN}:{PG_PASS}@localhost:5432/{DB_NAME}'
    engine = sqlalchemy.create_engine(DSN)
    create_tables(engine)

    Session = sessionmaker(bind=engine)
    session = Session()

    with open('data.json', 'r') as file:
        data = json.load(file)

    for record in data:
        model = {
            'publisher': Publisher,
            'shop': Shop,
            'book': Book,
            'stock': Stock,
            'sale': Sale,
        }[record.get('model')]
        session.add(model(id=record.get('pk'), **record.get('fields')))
    session.commit()

    id_input = input('Введите id издателя: ')
    q = session.query(Shop).join(Stock.shops).join(Stock.books).join(Book.publishers).filter(Book.id_publisher == id_input)
    pub_name = session.query(Publisher).filter(Publisher.id == id_input)
    print(f'Магазины, продающие издателя {pub_name.all()[0].name}: ')
    for s in q.all():
        print(s.name)

    session.close()


