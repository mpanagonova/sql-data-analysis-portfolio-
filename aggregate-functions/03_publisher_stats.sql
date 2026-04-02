-- Publisher Stats
-- Calculates key metrics per publisher including total books, stock levels, and average price.
-- Includes conditional aggregation to count out-of-stock items.

SELECT 
    p.name as publisher_name,
    COUNT(*) as book_count,
    SUM(b.stock_level) as total_stock,
    ROUND(AVG(b.price), 2) as avg_price,
    COUNT(CASE WHEN b.stock_level = 0 THEN 1 END) as out_of_stock
FROM publisher p
INNER JOIN book b ON p.id = b.publisher_id
GROUP BY p.id, p.name
ORDER BY book_count DESC;
