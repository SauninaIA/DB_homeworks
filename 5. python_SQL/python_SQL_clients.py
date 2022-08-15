import psycopg2


def create_table(cur):
    cur.execute("""
        DROP TABLE phone_nums;
        DROP TABLE clients;
        """)
    cur.execute("""
        CREATE TABLE IF NOT EXISTS clients(
            id SERIAL PRIMARY KEY,
            first_name VARCHAR(40) UNIQUE,
            last_name VARCHAR(40) UNIQUE,
            email VARCHAR(40) UNIQUE
            );
        """)
    cur.execute("""
        CREATE TABLE IF NOT EXISTS phone_nums(
            id SERIAL PRIMARY KEY,
            number VARCHAR(40),
            client_id INTEGER NOT NULL REFERENCES clients(id)
        );
        """)
    conn.commit()


def add_client(cur, first_name, last_name, email, number=None):
    cur.execute("""
        INSERT INTO clients(first_name, last_name, email) 
        VALUES(%s, %s, %s)
        RETURNING id;
        """, (first_name, last_name, email))
    client_id = cur.fetchone()
    if number != None:
        cur.execute("""
        INSERT INTO phone_nums(client_id, number)
        VALUES(%s, %s);
        """, (client_id, number))
    conn.commit()


def add_number(cur, id, number):
    cur.execute("""
            INSERT INTO phone_nums(client_id, number)
            VALUES(%s, %s);
            """, (id, number))
    conn.commit()


def update_client(cur, id, first_name=None, last_name=None, email=None, phone_number=None):
    if first_name != None:
        cur.execute("""
        UPDATE clients SET first_name=%s WHERE id=%s;
        """, (first_name, id))
    if last_name != None:
        cur.execute("""
        UPDATE clients SET last_name=%s WHERE id=%s;
        """, (last_name, id))
    if email != None:
        cur.execute("""
        UPDATE clients SET email=%s WHERE id=%s;
        """, (email, id))
    if phone_number != None:
        cur.execute("""
        UPDATE phone_nums SET number=%s WHERE client_id=%s;
        """, (phone_number, id))
    conn.commit()


def del_num(cur, id):
    cur.execute("""
            DELETE FROM phone_nums WHERE client_id=%s;
        """, (id,))
    conn.commit()

    
def find_id(cur, first_name=None, last_name=None, email=None, number=None):
    if first_name != None:
        cur.execute("""
        SELECT id FROM clients WHERE first_name=%s;
        """, (first_name,))
    if last_name != None:
        cur.execute("""
        SELECT id FROM clients WHERE last_name=%s;
        """, (last_name,))
    if email != None:
        cur.execute("""
        SELECT id FROM clients WHERE email=%s;
        """, (email,))
    if number != None:
        cur.execute("""
        SELECT client_id FROM phone_nums WHERE number=%s;
        """, (number,))
    print(cur.fetchone()[0])


def del_client(cur, id):
    cur.execute("""
               DELETE FROM phone_nums WHERE client_id=%s;
           """, (id,))
    cur.execute("""
               DELETE FROM clients WHERE id=%s;
           """, (id,))
    conn.commit()


if __name__ == '__main__':
    with psycopg2.connect(database='clients_DB', user='postgres', password='Marsik9699661') as conn:
        with conn.cursor() as cur:
            create_table(cur)
            add_client(cur, 'Timothy', 'Pittman', 'timothy_pittman@gmail.com')
            add_client(cur, 'Helen', 'Thompson', 'helen1956@gmail.com')
            add_client(cur, 'Kathleen', 'Davis', 'Katdavis@gmail.com', 89123456785)
            add_number(cur, 1, 89012345678)
            add_number(cur, 1, 890275890468)
            add_client(cur, 'David', 'Gibsson', 'DavGi55@gmail.com', 782647564477)
            update_client(cur, 4, last_name='Gibson')
            del_num(cur, 3)
            find_id(cur, first_name='Helen')
            find_id(cur, last_name='Pittman')
            find_id(cur, email='Katdavis@gmail.com')
            find_id(cur, number='782647564477')
            del_client(cur, 1)


