-- This scripts creates a table called 'products'
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	product_name TEXT,
	price DECIMAL (10, 2) NOT NULL CHECK (price > 0),
	stock_quantity INT
	);

-- This script creates a table called 'customers'
CREATE TABLE customers (
	id SERIAL PRIMARY KEY,
	first_name TEXT,
	last_anme TEXT,
	email TEXT UNIQUE NOT NULL
	);

-- This script creates a table called 'orders'
CREATE TABLE orders (
	id SERIAL PRIMARY KEY,
	customer_id INT REFERENCES customers(id),
	order_date DATE
	);

-- This table creates a table called 'order_items'
CREATE TABLE order_items (
	order_id INT REFERENCES orders(id),
	product_id INT REFERENCES products(id),
	quantity INT NOT NULL CHECK (quantity > 0),
	PRIMARY KEY (order_id, product_id)
	);