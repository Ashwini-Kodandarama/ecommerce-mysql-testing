
USE ecommerce_db;

-- Insert customers
INSERT INTO customers
(customer_name, email, city)
VALUES
('Ananya Sharma', 'ananya@example.com', 'Bangalore'),
('Rahul Verma', 'rahul@example.com', 'Mumbai'),
('Priya Rao', 'priya@example.com', 'Hyderabad'),
('Arjun Kumar', 'arjun@example.com', 'Chennai'),
('Sneha Patel', 'sneha@example.com', 'Pune');

-- Insert products
INSERT INTO products
(product_name, price, stock_quantity)
VALUES
('Laptop', 55000.00, 10),
('Mouse', 500.00, 50),
('Keyboard', 1200.00, 30),
('Headphones', 2000.00, 20),
('USB Cable', 300.00, 100);

-- Insert orders
INSERT INTO orders
(customer_id, order_date, order_status)
VALUES
(1, '2026-10-01', 'Delivered'),
(2, '2026-10-02', 'Shipped'),
(3, '2026-10-03', 'Pending'),
(1, '2026-10-04', 'Delivered'),
(4, '2026-10-05', 'Cancelled');

-- Insert order items
INSERT INTO order_items
(order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 55000.00),
(2, 2, 2, 500.00),
(3, 3, 1, 1200.00),
(4, 4, 2, 2000.00),
(5, 5, 3, 300.00);

-- Insert payments
INSERT INTO payments
(order_id, payment_amount, payment_status)
VALUES
(1, 55000.00, 'Success'),
(2, 1000.00, 'Success'),
(3, 1200.00, 'Pending'),
(4, 4000.00, 'Success'),
(5, 900.00, 'Refunded');
