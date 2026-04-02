-- New Customer Analysis
-- Analyzes top-selling books and purchases made by new customers.
-- Demonstrates use of multiple CTEs, joins, and aggregation.

WITH top_selling_books AS (
    -- Find the top 3 selling books
    SELECT
        book_id,
        SUM(quantity) AS total_sold
    FROM sale
    GROUP BY book_id
    ORDER BY SUM(quantity) DESC
    LIMIT 3
),
recent_customers AS (
    -- Find customers who joined after 2025-01-01
    SELECT id
    FROM customer
    WHERE joined_date > '2025-01-01'
)
SELECT
    b.title,
    tsb.total_sold,
    COUNT(DISTINCT s.customer_id) as new_customer_count
FROM top_selling_books tsb
INNER JOIN book b ON b.id = tsb.book_id
INNER JOIN sale s ON s.book_id = tsb.book_id
INNER JOIN recent_customers c ON c.id = s.customer_id
GROUP BY b.title, tsb.total_sold
ORDER BY tsb.total_sold DESC;
