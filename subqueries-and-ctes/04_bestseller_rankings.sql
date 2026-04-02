-- Bestseller Rankings
-- Calculates each book's contribution to total sales as a percentage.
-- Demonstrates use of CTE and aggregation for ranking analysis.

WITH sales_total AS (
    SELECT SUM(sales_count) as total_sales
    FROM book
)
SELECT
    title,
    sales_count,
    ROUND(
        (CAST(sales_count AS DECIMAL) / total_sales * 100),
        1
    ) as sales_percentage
FROM book
CROSS JOIN sales_total
ORDER BY sales_count DESC;
