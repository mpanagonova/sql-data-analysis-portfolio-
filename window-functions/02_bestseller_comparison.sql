-- Bestseller Comparison
-- Compares each book with the top and second-best seller in its category.
-- Demonstrates FIRST_VALUE(), NTH_VALUE(), and window frame usage.

SELECT
    title,
    category,
    copies_sold,
    FIRST_VALUE(title) OVER (
        PARTITION BY category
        ORDER BY copies_sold DESC
    ) as category_bestseller,
    NTH_VALUE(title, 2) OVER (
        PARTITION BY category
        ORDER BY copies_sold DESC
        RANGE BETWEEN
            UNBOUNDED PRECEDING AND
            UNBOUNDED FOLLOWING
    ) as second_bestseller
FROM book
ORDER BY category, copies_sold DESC;
