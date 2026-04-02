-- Premium Authors
-- Filters authors based on multiple performance criteria such as book count, price, and rating.
-- Demonstrates use of HAVING with multiple aggregate conditions.

SELECT 
    a.name as author_name,
    COUNT(*) as book_count,
    ROUND(AVG(b.price), 2) as avg_price,
    ROUND(AVG(b.rating), 2) as avg_rating
FROM author a
INNER JOIN book b ON a.id = b.author_id
GROUP BY a.id, a.name
HAVING 
    COUNT(*) >= 2 
    AND AVG(b.price) > 40 
    AND AVG(b.rating) > 4.5
ORDER BY avg_rating DESC;
