CREATE TABLE employees (
     id SERIAL PRIMARY KEY,
     first_name TEXT NOT NULL,
     last_name TEXT NOT NULL,
     month_at_job INT NOT NULL DEFAULT 0,
     full_time BOOLEAN NOT NULL
);


CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE managers (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE employees_department_managers (
    emp_id INT PRIMARY KEY REFERENCES employees,
    dept_id INT NOT NULL REFERENCES departments,
    mang_id INT REFERENCES employees
);

INSERT INTO employees (first_name, last_name, month_at_job, full_time) VALUES
    ('nick', 'styles',32, TRUE),
    ('Aliya','Mantas',12,TRUE),
    ('Eric', 'Schmidt',6,FALSE),
    ('Jesus', 'Allende', 8, FALSE),
    ('Genna', 'Sussman', 15, TRUE),
    ('Leslie','Costas',18,TRUE),
    ('Janet','Nopales',16,TRUE),
    ('Roger','Clark',43,TRUE);

INSERT INTO departments (name) VALUES
    ('Exec'),
    ('Legal'),
    ('Finance');

INSERT INTO employees_department_managers (emp_id,dept_id,mang_id) VALUES
    (1,2,5),
    (2,2,5),
    (3,2,2),
    (4,2,5),
    (5,1,NULL),
    (6,3,8),
    (7,3,8),
    (8,3,5);

    SELECT employees.first_name, employees.last_name, employees_department_managers.mang_id FROM employees_department_managers RIGHT JOIN employees ON emp_id = employees.id AND mang_id = employees.id;


