-- Create the database
CREATE DATABASE IF NOT EXISTS online_shop;
USE online_shop;

-- Create Customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE DEFAULT (CURRENT_DATE)
);

-- Create Products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0
);

-- Create Orders table (linking customers and products)
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT NOT NULL,
    order_date DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert sample data
INSERT INTO customers (first_name, last_name, email) VALUES
('John', 'Doe', 'john@example.com'),
('Jane', 'Smith', 'jane@example.com'),
('Samatar', 'Ali', 'samatar@example.com');

INSERT INTO products (product_name, price, stock_quantity) VALUES
('Laptop', 999.99, 10),
('Wireless Mouse', 25.50, 50),
('Mechanical Keyboard', 75.00, 20);

INSERT INTO orders (customer_id, product_id, quantity) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1);

-- Query the data
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;

-- A simple JOIN to see who ordered what
SELECT c.first_name, c.last_name, p.product_name, o.quantity
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id;
-- ========================================================
-- Week 1 Database Assignment: Online Shop
-- Description: A simple database to manage an online store
-- ========================================================

-- 1. Create the Database
CREATE DATABASE IF NOT EXISTS online_shop;
USE online_shop;

-- 2. Create the Customers Table
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE DEFAULT (CURRENT_DATE)
);

-- 3. Create the Products Table
CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0
);

-- 4. Create the Orders Table (linking Customers and Products)
CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT NOT NULL,
    order_date DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ========================================================
-- 5. Insert Sample Data
-- ========================================================

-- Insert Customers
INSERT INTO customers (first_name, last_name, email) VALUES
('John', 'Doe', 'john@example.com'),
('Jane', 'Smith', 'jane@example.com'),
('Samatar', 'Ali', 'samatar@example.com');

-- Insert Products
INSERT INTO products (product_name, price, stock_quantity) VALUES
('Laptop', 999.99, 10),
('Wireless Mouse', 25.50, 50),
('Mechanical Keyboard', 75.00, 20);

-- Insert Orders
INSERT INTO orders (customer_id, product_id, quantity) VALUES
(1, 1, 1),  -- John bought 1 Laptop
(2, 2, 2),  -- Jane bought 2 Mice
(3, 3, 1);  -- Samatar bought 1 Keyboard

-- ========================================================
-- 6. Demonstrate Queries (Reading Data)
-- ========================================================

-- View all customers
SELECT * FROM customers;

-- View all products
SELECT * FROM products;

-- View all orders
SELECT * FROM orders;

-- Complex Query: See which customer ordered which product and how many
SELECT 
    c.first_name, 
    c.last_name, 
    p.product_name, 
    o.quantity, 
    o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id;
