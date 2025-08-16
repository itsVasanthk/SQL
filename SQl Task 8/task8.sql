use ecommerce_db;

DELIMITER $$

CREATE PROCEDURE GetCustomerOrders(IN cust_id INT)
BEGIN
    SELECT o.order_id, o.order_date, p.amount
    FROM Orders o
    JOIN Payments p ON o.order_id = p.order_id
    WHERE o.customer_id = cust_id;
END$$

DELIMITER ;

CALL GetCustomerOrders(1);

DELIMITER $$

CREATE FUNCTION TotalSpent(cust_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(p.amount) INTO total
    FROM Orders o
    JOIN Payments p ON o.order_id = p.order_id
    WHERE o.customer_id = cust_id;
    RETURN IFNULL(total,0);
END$$

DELIMITER ;

SELECT name, TotalSpent(customer_id) AS total_spent
FROM Customers;

DROP PROCEDURE IF EXISTS GetCustomerOrders;
DROP FUNCTION IF EXISTS TotalSpent;
