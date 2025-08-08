USE ecommerce_db;

SELECT COUNT(*) AS total_customers
FROM Customers;

SELECT SUM(amount) AS total_sales
FROM Payments;

SELECT AVG(price) AS avg_price
FROM Products;

SELECT c.name, SUM(p.amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Payments p ON o.order_id = p.order_id
GROUP BY c.name;

SELECT c.name, COUNT(o.order_id) AS orders_count
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name;

SELECT c.name, SUM(p.amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Payments p ON o.order_id = p.order_id
GROUP BY c.name
HAVING SUM(p.amount) > 50000;

SELECT pr.name, SUM(oi.quantity) AS total_sold
FROM Order_Items oi
JOIN Products pr ON oi.product_id = pr.product_id
GROUP BY pr.name;
