-- ========================================
-- Task 3: SQL Basics – Filtering, Sorting & Aggregations
-- Database: MySQL / PostgreSQL
-- Dataset: Superstore
-- ========================================

-- 1. Create database
CREATE DATABASE IF NOT EXISTS superstore_db;
USE superstore_db;

-- 2. Create table
CREATE TABLE orders (
    order_id VARCHAR(20) PRIMARY KEY,
    order_date DATE NOT NULL,
    ship_date DATE,
    customer_name VARCHAR(100),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    region VARCHAR(50),
    sales DECIMAL(10,2),
    profit DECIMAL(10,2)
);

-- 3. Verify data import
SELECT COUNT(*) AS total_records FROM orders;

-- 4. Basic SELECT
SELECT * FROM orders LIMIT 10;

-- 5. Filtering using WHERE
SELECT *
FROM orders
WHERE category = 'Technology';

-- 6. Sorting using ORDER BY
SELECT order_id, sales
FROM orders
ORDER BY sales DESC
LIMIT 10;

-- 7. Aggregation: Sales & Profit by Category
SELECT 
    category,
    SUM(sales) AS total_sales,
    AVG(profit) AS avg_profit,
    COUNT(*) AS total_orders
FROM orders
GROUP BY category;

-- 8. Aggregation: Sales by Region
SELECT 
    region,
    SUM(sales) AS total_sales
FROM orders
GROUP BY region
ORDER BY total_sales DESC;

-- 9. HAVING clause
SELECT 
    category,
    SUM(sales) AS total_sales
FROM orders
GROUP BY category
HAVING SUM(sales) > 100000;

-- 10. BETWEEN for date range (Monthly report)
SELECT 
    order_id,
    order_date,
    sales
FROM orders
WHERE order_date BETWEEN '2017-01-01' AND '2017-01-31';

-- 11. LIKE for pattern search
SELECT *
FROM orders
WHERE customer_name LIKE '%Smith%';

-- 12. Top 5 customers by total spend
SELECT 
    customer_name,
    SUM(sales) AS total_spent
FROM orders
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 5;
