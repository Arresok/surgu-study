-- N1
SELECT 
    c.full_name,
    o.order_date
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id;

-- N2

SELECT 
    c.full_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id is NULL

-- N3
SELECT
    p.product_name,
    oi.quantity,
    oi.price_per_unit
FROM Order_Items oi
INNER JOIN Products p ON oi.product_id = p.product_id
WHERE oi.order_id = 1

-- N4
SELECT full_name
FROM Customers
WHERE customer_id in ( 
    SELECT o.customer_id
    FROM Orders o
    JOIN Order_items oi ON o.order_id = oi.order_id
    JOIN Products p ON oi.product_id = p.product_id
    WHERE p.product_name = 'Смартфон'

)
-- N5
SELECT 
    product_name,
    price
FROM Products
WHERE price > (select avg(price) FROM Products)

-- N6
SELECT 
    order_id,
    order_date
FROM Orders o
WHERE EXISTS (
    SELECT 1
    FROM Order_Items oi
    WHERE oi.order_id = o.order_id
        AND oi.price_per_unit > 100000
)

-- N7.1 LEFT JOIN
SELECT c.full_name
FROM Customers c
LEFT JOIN (
    SELECT DISTINCT o.customer_id
    FROM Orders o
    JOIN Order_Items oi ON o.order_id = oi.order_id
    JOIN Products p ON oi.product_id = p.product_id
    WHERE p.product_name = 'Ноутбук'
) buyers_with_laptop ON c.customer_id = buyers_with_laptop.customer_id
WHERE buyers_with_laptop.customer_id IS NULL

-- N7.2 NOT IN 
SELECT full_name
FROM Customers
WHERE Customer_id NOT IN (
    SELECT o.customer_id
    FROM Orders o
    JOIN Order_Items oi ON o.order_id = oi.order_id
    JOIN Products p ON oi.product_id = p.product_id
    WHERE p.product_name = 'Ноутбук'

)

-- N8
SELECT p.product_name
FROM Order_Items oi
RIGHT JOIN Products p ON oi.product_id = p.product_id
WHERE oi.order_item_id IS NULL

-- N9
SELECT 
    c.full_name,
    p.product_name,
    oi.quantity
FROM Customers c
FULL OUTER JOIN Orders o ON c.customer_id = o.customer_id
FULL OUTER JOIN Order_Items oi ON o.order_id = oi.order_id
FULL OUTER JOIN Products p ON oi.product_id = p.product_id

-- N10.1 JOIN
SELECT DISTINCT c.full_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
WHERE p.price = (SELECT MAX(price) FROM Products)

-- N10.2 NOT JOIN
SELECT full_name
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
    WHERE order_id IN (
        SELECT order_id
        FROM Order_Items
        WHERE product_id IN (
            SELECT product_id
            FROM Products
            WHERE price = (SELECT MAX(price) FROM Products)
        )
    )
)

-- N11
SELECT 
    c.full_name,
    cats.category
FROM Customers c
CROSS JOIN (SELECT DISTINCT category FROM Products) cats
ORDER BY c.full_name, cats.category;

-- N12
SELECT 
    cust.full_name AS new_customer,
    rec.full_name AS recommended_by
FROM Customers cust
INNER JOIN Customers rec ON cust.recommended_by = rec.customer_id

-- PRACTICA 9
-- N1
SELECT 
    category,
    COUNT(*) AS products_count
FROM Products
GROUP BY category

-- N2
SELECT 
    SUM(quantity * price_per_unit) AS total_revenue
FROM Order_Items

-- N3
SELECT 
    c.full_name,
    COUNT(o.order_id) AS orders_count
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name

-- N4
SELECT 
    ROUND(AVG(order_total), 2) AS average_order_value
FROM (
    SELECT 
        order_id,
        SUM(quantity * price_per_unit) AS order_total
    FROM Order_Items
    GROUP BY order_id
) sub;

-- N5
SELECT 
    status,
    COUNT(*) AS orders_count
FROM Orders
GROUP BY status

-- N6
SELECT 
    category,
    COUNT(*) AS products_count
FROM Products
GROUP BY category
HAVING COUNT(*) > 1

-- N7
SELECT 
    c.full_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name
HAVING COUNT(o.order_id) > 1

-- N8
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_sold_quantity
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold_quantity DESC
LIMIT 1