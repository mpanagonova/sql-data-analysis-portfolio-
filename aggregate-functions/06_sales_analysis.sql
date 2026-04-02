-- Sales Analysis
-- Generates category-level sales insights including total sales, revenue, and maximum quantity.
-- Combines JOIN, GROUP BY, and HAVING to produce business-driven analytics.

SELECT 
    b.category,
    COUNT(*) as total_sales,
    SUM(s.quantity) as total_quantity,
    SUM(s.quantity * s.unit_price) as total_revenue,
    ROUND(AVG(s.unit_price), 2) as avg_price,
    MAX(s.quantity) as max_quantity
FROM sale s
INNER JOIN book b ON s.book_id = b.id
GROUP BY b.category
HAVING SUM(s.quantity * s.unit_price) > 50
ORDER BY total_revenue DESC;
