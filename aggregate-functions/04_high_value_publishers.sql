-- High Value Publishers
-- Identifies publishers that meet specific business criteria (book count, price, stock).
-- Uses HAVING to filter aggregated results based on multiple conditions.

SELECT 
    p.name as publisher_name,
    COUNT(*) as book_count,
    ROUND(AVG(b.price), 2) as avg_price,
    SUM(b.stock_level) as total_stock
FROM publisher p
INNER JOIN book b ON p.id = b.publisher_id
GROUP BY p.id, p.name
HAVING 
    COUNT(*) > 1 
    AND AVG(b.price) > 35 
    AND SUM(b.stock_level) > 30
ORDER BY avg_price DESC;
