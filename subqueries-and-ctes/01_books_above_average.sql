-- Books Above Average
-- Identifies books priced above the average price.
-- Demonstrates use of subqueries for filtering based on aggregated values.

SELECT 
    title,
    category,
    price,
    ROUND(price - (
        SELECT AVG(price)
        FROM book
    ), 2) as above_average
FROM book
WHERE price > (
    SELECT AVG(price)
    FROM book
)
ORDER BY price DESC;
