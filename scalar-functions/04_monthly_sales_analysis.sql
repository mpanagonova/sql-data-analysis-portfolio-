-- Monthly Sales Analysis
-- Summarizes sales by month and classifies performance levels.
-- Demonstrates date formatting, aggregation, and conditional logic.

SELECT
    TO_CHAR(sale_date, 'Month YYYY') as month,
    SUM(total_amount) as total_sales,
    CASE
        WHEN SUM(total_amount) > 500 THEN 'Excellent'
        WHEN SUM(total_amount) >= 200 THEN 'Good'
        ELSE 'Needs Improvement'
    END as performance
FROM book_sale
GROUP BY TO_CHAR(sale_date, 'Month YYYY'), DATE_TRUNC('month', sale_date)
ORDER BY DATE_TRUNC('month', sale_date);
