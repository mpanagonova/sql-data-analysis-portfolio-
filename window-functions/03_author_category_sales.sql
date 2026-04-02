-- Author Category Sales
-- Compares book sales with the average sales within each category.
-- Demonstrates use of window functions with JOINs for analytical insights.

SELECT 
    a.name as author_name,
    b.title,
    b.category,
    b.copies_sold,
    ROUND(AVG(b.copies_sold) OVER (
        PARTITION BY b.category
    ), 2) as category_avg
FROM book b
INNER JOIN author a ON a.id = b.author_id
ORDER BY b.category, b.copies_sold DESC;
