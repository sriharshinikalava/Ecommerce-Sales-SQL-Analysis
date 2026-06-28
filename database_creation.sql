-- =========================================
-- Ecommerce Sales Analysis Database
-- Creating database for sales analysis project
-- =========================================

    CREATE DATABASE ecommerce_sales_analysis;

-- Selecting the created database to work with
    
     USE ecommerce_sales_analysis;

-- =========================================
-- Creating Customers table
-- Stores customer details like name and location
-- =========================================

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50)
);  

-- =========================================
-- Creating Products table
-- Stores product information and pricing details
-- =========================================

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- =========================================
-- Creating Orders table
-- Stores customer orders and transaction details
-- =========================================

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
-- Linking Orders table with Customers table
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- =========================================
-- Creating Order_Items table
-- Stores product details for each order
-- =========================================

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,

    -- Linking Order_Items with Orders table
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),

    -- Linking Order_Items with Products table
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);















