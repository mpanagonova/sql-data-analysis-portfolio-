-- Price Range Analysis
-- Analyzes books within similar price ranges using window frames.
-- Demonstrates RANGE BETWEEN for dynamic window calculations.

SELECT
    title,
    price,
    copies_sold,
    ROUND(AVG(copies_sold) OVER (
        ORDER BY price
        RANGE BETWEEN 5 PRECEDING AND 5 FOLLOWING
    )) as similar_price_avg,
    COUNT(*) OVER (
        ORDER BY price
        RANGE BETWEEN 5 PRECEDING AND 5 FOLLOWING
    ) as books_in_range
FROM book
ORDER BY price, title;
