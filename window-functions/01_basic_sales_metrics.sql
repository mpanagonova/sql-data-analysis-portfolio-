-- Basic Sales Metrics
-- Compares each book's price with the average price in its category.
-- Demonstrates use of AVG() with PARTITION BY for group-level comparison.

SELECT
    book_title,
    category,
    price,
    ROUND(AVG(price) OVER (
        PARTITION BY category
    ), 2) as category_avg
FROM sale
ORDER BY category, price DESC;
