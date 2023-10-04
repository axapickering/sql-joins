CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL
);

CREATE TABLE models (
    code VARCHAR(5) PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE,
    base_cost NUMERIC NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES customers,
    placed_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMETAMP
);

CREATE TABLE order_contents (
    id SERIAL PRIMARY KEY
    order_id INTEGER REFERENCES orders,
    model TEXT NOT NULL REFERENCES models,
    purchase_price NUMERIC NOT NULL,
    note TEXT
);