use ecommerce_db;

CREATE VIEW customer_orders AS
SELECT c.name AS customer_name, o.order_id, o.order_date
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;

SELECT * FROM customer_orders;

CREATE VIEW customer_spending AS
SELECT c.name AS customer_name, SUM(p.amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Payments p ON o.order_id = p.order_id
GROUP BY c.name;

SELECT * FROM customer_spending WHERE total_spent > 50000;

CREATE VIEW order_details AS
SELECT o.order_id, c.name AS customer_name, pr.name AS product_name, oi.quantity, p.amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products pr ON oi.product_id = pr.product_id
JOIN Payments p ON o.order_id = p.order_id;

SELECT * FROM order_details ORDER BY order_id;

DROP VIEW IF EXISTS customer_spending;
