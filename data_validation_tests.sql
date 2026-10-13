
USE ecommerce_db;

-- 1. Check for customers with missing names
SELECT *
FROM customers
WHERE customer_name IS NULL
   OR customer_name = '';

-- 2. Check for negative product prices
SELECT *
FROM products
WHERE price < 0;

-- 3. Check for negative stock quantities
SELECT *
FROM products
WHERE stock_quantity < 0;

-- 4. Find orders without a valid customer
SELECT o.*
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- 5. Find order items without a valid product
SELECT oi.*
FROM order_items oi
LEFT JOIN products p
ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;

-- 6. Compare order totals with payment amounts
SELECT
    o.order_id,
    COALESCE(SUM(oi.quantity * oi.unit_price), 0)
        AS order_total,
    COALESCE(SUM(DISTINCT p.payment_amount), 0)
        AS payment_total
FROM orders o
LEFT JOIN order_items oi
ON o.order_id = oi.order_id
LEFT JOIN payments p
ON o.order_id = p.order_id
GROUP BY o.order_id;

-- 7. Find orders with no payment record
SELECT o.order_id
FROM orders o
LEFT JOIN payments p
ON o.order_id = p.order_id
WHERE p.payment_id IS NULL;

-- 8. Find duplicate customer emails
SELECT email, COUNT(*) AS occurrences
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;
