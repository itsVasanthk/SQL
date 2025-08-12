USE ecommerce_db;

SELECT *
FROM Products
WHERE price > (SELECT AVG(price) FROM Products);

SELECT name
FROM Customers
WHERE customer_id IN (SELECT customer_id FROM Orders);

SELECT name
FROM Customers c
WHERE EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.customer_id = c.customer_id
);

SELECT name
FROM Customers c
WHERE (SELECT SUM(p.amount)
       FROM Orders o
       JOIN Payments p ON o.order_id = p.order_id
       WHERE o.customer_id = c.customer_id) > 50000;

SELECT t.name, t.total_spent
FROM (
    SELECT c.name, SUM(p.amount) AS total_spent
    FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN Payments p ON o.order_id = p.order_id
    GROUP BY c.name
) AS t
WHERE t.total_spent > 50000;

