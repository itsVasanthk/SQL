USE ecommerce_db;

SELECT * FROM Products;

SELECT name, price FROM Products;

SELECT * FROM Customers
WHERE name = 'Vijay';

SELECT * FROM Products
WHERE price > 1000 AND price < 50000;

SELECT * FROM Customers
WHERE email LIKE '%@example.com';

SELECT * FROM Orders
WHERE order_date BETWEEN '2025-08-01' AND '2025-08-05';

SELECT * FROM Products
ORDER BY price DESC;

SELECT * FROM Products
ORDER BY price ASC
LIMIT 2;

SELECT * FROM Products
WHERE name = 'Laptop' OR name = 'Smartphone';
