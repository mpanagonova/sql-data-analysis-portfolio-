-- Month-over-Month Sales
-- Analyzes sales trends by comparing current and previous month performance.
-- Demonstrates use of LAG() for time-based calculations.

SELECT
    title,
    sale_month,
    copies_sold as current_sales,
    LAG(copies_sold) OVER (
        PARTITION BY title
        ORDER BY sale_month
    ) as prev_sales,
    copies_sold - LAG(copies_sold) OVER (
        PARTITION BY title
        ORDER BY sale_month
    ) as sales_change,
    ROUND(
        ((copies_sold - LAG(copies_sold) OVER (
            PARTITION BY title
            ORDER BY sale_month
        )) * 100.0 / NULLIF(LAG(copies_sold) OVER (
            PARTITION BY title
            ORDER BY sale_month
        ), 0)),
        1
    ) as pct_change
FROM sale
ORDER BY title, sale_month;
