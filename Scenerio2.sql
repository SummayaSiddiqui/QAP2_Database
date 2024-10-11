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

-- This script creates a table called 'order_items'
CREATE TABLE order_items (
	order_id INT REFERENCES orders(id),
	product_id INT REFERENCES products(id),
	quantity INT NOT NULL CHECK (quantity > 0),
	PRIMARY KEY (order_id, product_id)
	);

-- This script inserts data into the 'products' table
INSERT INTO products (product_name, price, stock_quantity)
VALUES
	('Laptop', 999.99, 10),
    ('Smartphone', 699.99, 20),
    ('Headphones', 199.99, 30),
    ('Smartwatch', 249.99, 15),
    ('USB Cable', 9.99, 100);

-- This scripts alter the name of a column in 'customers' table
Alter TABLE customers
RENAME COLUMN last_anme TO last_name;

-- This scripts inserts data into the 'customers' table
INSERT INTO customers (first_name, last_name, email)
VALUES
    ('Alice', 'Johnson', 'alice.johnson@example.com'),
    ('Bob', 'Smith', 'bob.smith@example.com'),
    ('Charlie', 'Brown', 'charlie.brown@example.com'),
    ('Diana', 'White', 'diana.white@example.com');

-- This script inserts data into the 'orders' table
INSERT INTO orders (customer_id, order_date)
VALUES
    (1, '2024-10-10'),
    (2, '2024-10-11'),
    (3, '2024-10-12'),
    (4, '2024-10-13');

-- This script inserta data into the 'order_items' table
INSERT INTO order_items (order_id, product_id, quantity)
VALUES
    (1, 1, 1),  -- Order 1: 1 Laptop
    (1, 2, 2),  -- Order 1: 2 Smartphones
    (2, 3, 1),  -- Order 2: 1 Headphone
    (2, 4, 1),  -- Order 2: 1 Smartwatch
    (3, 1, 1),  -- Order 3: 1 Laptop
    (3, 5, 5),  -- Order 3: 5 USB Cables
    (4, 2, 1),  -- Order 4: 1 Smartphone
    (4, 3, 3);  -- Order 4: 3 Headphones

-- This script retrieves names and stock quantities of all products
SELECT product_name, stock_quantity FROM products;

-- This script retrieves the product names and quantities for one of the orders placed.
SELECT product_name, quantity
FROM products
JOIN order_items ON products.id = order_items.product_id
JOIN orders ON order_items.order_id = orders.id
JOIN customers ON orders.customer_id = customers.id
WHERE orders.id = 3; 

-- This script retrieves all orders placed by a specific customer (including the ID’s of what was ordered and the quantities).
SELECT first_name || ' ' || last_name AS full_name,
orders.id AS order_id, order_items.product_id, products.product_name, order_items.quantity
FROM orders
JOIN customers ON orders.customer_id = customers.id
JOIN order_items ON orders.id = order_items.order_id
JOIN products ON order_items.product_id = products.id
WHERE first_name = 'Alice' AND last_name = 'Johnson'; 

-- Simulate reducing stock for Order # 1
UPDATE products
SET stock_quantity = stock_quantity - order_items.quantity
From order_items
JOIN orders ON order_items.order_id = orders.id
WHERE orders.id = 1
AND products.id = order_items.product_id;
