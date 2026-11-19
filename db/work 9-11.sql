
-- #1
SELECT 
    category, 
    COUNT(*) AS product_count
FROM Products
GROUP BY category;

-- #2
SELECT 
    SUM(quantity * price_per_unit) AS total_revenue
FROM Order_Items;

-- #3
SELECT 
    c.full_name, 
    COUNT(o.order_id) AS order_count
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name;

-- #4
SELECT 
    AVG(order_total) AS average_order_amount
FROM (
    SELECT 
        order_id, 
        SUM(quantity * price_per_unit) AS order_total
    FROM Order_Items
    GROUP BY order_id
) AS order_sums;

-- #5
SELECT 
    status, 
    COUNT(*) AS order_count
FROM Orders
GROUP BY status;

-- #6
SELECT 
    category, 
    COUNT(*) AS product_count
FROM Products
GROUP BY category
HAVING COUNT(*) > 1;

-- #7
SELECT 
    c.full_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name
HAVING COUNT(o.order_id) > 1;

-- #8
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC
LIMIT 1;



