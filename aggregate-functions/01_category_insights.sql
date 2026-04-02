-- Category Insights
-- Analyzes book categories by calculating number of books, total stock, and average price.
-- Demonstrates use of JOIN, GROUP BY, and aggregate functions for inventory analysis.

SELECT 
    c.name as category_name,
    COUNT(*) as book_count,
    SUM(b.in_stock) as total_stock,
    ROUND(AVG(b.price), 2) as avg_price
FROM category c
INNER JOIN book b ON c.id = b.category_id
GROUP BY c.name
ORDER BY book_count DESC;
