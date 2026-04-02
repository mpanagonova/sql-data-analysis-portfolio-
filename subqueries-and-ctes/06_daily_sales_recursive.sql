-- Daily Sales Report
-- Generates a complete date range and calculates daily sales, including days with no sales.
-- Demonstrates use of recursive CTEs for time series analysis.

WITH RECURSIVE date_range AS (
    -- Base case: start with January 1st
    SELECT DATE '2025-01-01' as date
    
    UNION ALL
    
    -- Recursive case: add one day until January 15th
    SELECT date + 1
    FROM date_range
    WHERE date < DATE '2025-01-15'
)
SELECT 
    date_range.date,
    COUNT(s.id) as sale_count,
    COALESCE(SUM(s.amount), 0.00) as total_amount
FROM date_range
LEFT JOIN sale s ON s.sale_date = date_range.date
GROUP BY date_range.date
ORDER BY date_range.date;
