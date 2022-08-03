CREATE TABLE IF NOT EXISTS departments (
	       id SERIAL PRIMARY KEY,
        title VARCHAR(30) NOT NULL	
);

CREATE TABLE IF NOT EXISTS employees (
           id SERIAL PRIMARY KEY,
         name VARCHAR(30) NOT NULL,
id_department INTEGER REFERENCES departments(id),
   id_manager INTEGER REFERENCES employees(id)
);