-- =========================================
-- Ecommerce Sales Analysis Project
-- SQL Analysis Queries
-- Used to generate business insights
-- =========================================


-- =========================================
-- 1. Total Sales Analysis
-- Calculates the overall revenue generated
-- =========================================

SELECT 
    SUM(total_amount) AS total_sales
FROM Orders;



-- =========================================
-- 2. Total Orders Analysis
-- Counts the total number of orders placed
-- =========================================

SELECT 
    COUNT(order_id) AS total_orders
FROM Orders;



-- =========================================
-- 3. Average Order Value Analysis
-- Calculates average spending per order
-- =========================================

SELECT 
    AVG(total_amount) AS average_order_value
FROM Orders;



-- =========================================
-- 4. Top 5 Highest Value Orders
-- Identifies orders with the highest purchase amount
-- =========================================

SELECT 
    order_id,
    total_amount
FROM Orders
ORDER BY total_amount DESC
LIMIT 5;



-- =========================================
-- 5. Category Wise Sales Analysis
-- Analyzes revenue contribution by product category
-- Uses JOIN and GROUP BY
-- =========================================

SELECT 
    p.category,
    SUM(o.total_amount) AS category_sales
FROM Orders o
JOIN Order_Items oi
ON o.order_id = oi.order_id
JOIN Products p
ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY category_sales DESC;



-- =========================================
-- 6. Top Selling Products Analysis
-- Finds products based on quantity sold
-- =========================================

SELECT 
    p.product_name,
    p.category,
    SUM(oi.quantity) AS total_quantity_sold
FROM Order_Items oi
JOIN Products p
ON oi.product_id = p.product_id
GROUP BY p.product_name, p.category
ORDER BY total_quantity_sold DESC
LIMIT 5;



-- =========================================
-- 7. Customer Spending Analysis
-- Identifies customers with highest purchase value
-- =========================================

SELECT 
    c.customer_name,
    c.city,
    SUM(o.total_amount) AS total_spent
FROM Orders o
JOIN Customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_name, c.city
ORDER BY total_spent DESC
LIMIT 5;



-- =========================================
-- 8. Monthly Sales Trend Analysis
-- Analyzes sales performance month-wise
-- =========================================

SELECT 
    MONTH(order_date) AS month,
    SUM(total_amount) AS monthly_sales
FROM Orders
GROUP BY MONTH(order_date)
ORDER BY month;