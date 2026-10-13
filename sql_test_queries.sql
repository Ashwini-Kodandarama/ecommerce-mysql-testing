
USE ecommerce_db;

-- 1. Display all customers
SELECT * FROM customers;

-- 2. Find customers from Bangalore
SELECT *
FROM customers
WHERE city = 'Bangalore';

-- 3. Find products priced above 1000
SELECT *
FROM products
WHERE price > 1000;

-- 4. Sort products from highest to lowest price
SELECT *
FROM products
ORDER BY price DESC;

-- 5. Count total customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- 6. Find the average product price
SELECT AVG(price) AS average_price
FROM products;

-- 7. Display orders with customer names
SELECT o.order_id, c.customer_name,
       o.order_date, o.order_status
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id;

-- 8. Count orders by status
SELECT order_status, COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;

-- 9. Find customers who placed more than one order
SELECT c.customer_id, c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 1;

-- 10. Calculate each order's item total
SELECT order_id,
       SUM(quantity * unit_price) AS order_total
FROM order_items
GROUP BY order_id;

-- 11. Find products with stock below 25
SELECT *
FROM products
WHERE stock_quantity < 25;

-- 12. Find orders with successful payments
SELECT o.order_id, p.payment_amount,
       p.payment_status
FROM orders o
JOIN payments p
ON o.order_id = p.order_id
WHERE p.payment_status = 'Success';
