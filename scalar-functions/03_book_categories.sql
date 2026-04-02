-- Book Categories
-- Categorizes books by length, stock level, and popularity based on business rules.
-- Demonstrates multiple CASE expressions for data classification.

SELECT
    title,
    CASE
        WHEN page_count < 300 THEN 'Short'
        WHEN page_count <= 400 THEN 'Medium'
        ELSE 'Long'
    END as length_category,
    CASE
        WHEN copies_in_stock < 3 THEN 'Low'
        WHEN copies_in_stock <= 7 THEN 'Medium'
        ELSE 'High'
    END as stock_status,
    CASE
        WHEN monthly_rentals > 12 THEN 'High Demand'
        WHEN monthly_rentals >= 6 THEN 'Medium Demand'
        ELSE 'Low Demand'
    END as popularity
FROM book
ORDER BY monthly_rentals DESC;
