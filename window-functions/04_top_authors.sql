-- Top Authors
-- Ranks authors based on total copies sold.
-- Demonstrates use of RANK() with aggregated data.

SELECT 
    a.name as author_name,
    a.country,
    SUM(b.copies_sold) as total_copies,
    RANK() OVER (ORDER BY SUM(b.copies_sold) DESC) as author_rank
FROM author a
INNER JOIN book b ON b.author_id = a.id
GROUP BY a.id, a.name, a.country
ORDER BY author_rank
LIMIT 3;
