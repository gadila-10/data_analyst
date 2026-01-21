 1. INNER JOIN: Orders with Customer Details

SELECT
    o.order_id,
    o.order_date,
    c.customer_id,
    c.customer_name,
    c.country,
    o.total_amount
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
ORDER BY o.order_date;

-- =========================================
-- 2. LEFT JOIN: Customers with NO Orders
-- =========================================
SELECT
    c.customer_id,
    c.customer_name,
    c.country
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- =========================================
-- 3. Revenue Per Product
-- =========================================
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items oi
INNER JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC;

-- =========================================
-- 4. Category-wise Revenue Distribution
-- =========================================
SELECT
    cat.category_name,
    SUM(oi.quantity * oi.unit_price) AS category_revenue
FROM order_items oi
INNER JOIN products p
    ON oi.product_id = p.product_id
INNER JOIN categories cat
    ON p.category_id = cat.category_id
GROUP BY cat.category_name
ORDER BY category_revenue DESC;

-- =========================================
-- 5. Sales in a Specific Region & Date Range
-- Example: Sales in USA between 2023-01-01 and 2023-12-31
-- =========================================
SELECT
    c.country,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_sales
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
WHERE c.country = 'USA'
  AND o.order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY c.country;

-- =========================================
-- 6. Validate Orders Count After JOIN
-- =========================================
SELECT COUNT(*) AS total_orders FROM orders;

SELECT COUNT(*) AS joined_orders
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id;
