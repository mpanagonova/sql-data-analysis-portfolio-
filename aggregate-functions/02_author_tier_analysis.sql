-- Author Tier Analysis
-- Classifies authors into tiers based on the number of books written.
-- Uses CASE expressions combined with COUNT() to apply business logic.

SELECT 
    a.name as author_name,
    COUNT(*) as book_count,
    CASE 
        WHEN COUNT(*) >= 3 THEN 'Prolific Author'
        WHEN COUNT(*) = 2 THEN 'Established Author'
        ELSE 'New Author'
    END as author_tier
FROM author a
INNER JOIN book b ON a.id = b.author_id
GROUP BY a.name
ORDER BY book_count DESC;
