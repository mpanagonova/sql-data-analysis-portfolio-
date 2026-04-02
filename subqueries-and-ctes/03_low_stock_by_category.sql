-- Low Stock by Category
-- Identifies books with stock levels below their category average.
-- Demonstrates correlated subqueries with aggregation per group.

SELECT 
    b1.title,
    b1.category,
    b1.stock,
    ROUND((
        SELECT AVG(stock)
        FROM book b2
        WHERE b2.category = b1.category
    ), 1) as category_avg
FROM book b1
WHERE b1.stock < (
    SELECT AVG(stock)
    FROM book b2
    WHERE b2.category = b1.category
);
