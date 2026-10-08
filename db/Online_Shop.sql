-- N1
SELECT 
    c.full_name,
    o.order_date
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id;