-- Latest Category Books
-- Retrieves the most recently published book in each category.
-- Demonstrates correlated subqueries using MAX() for group-wise filtering.

SELECT 
    b1.category,
    b1.title,
    b1.published_date,
    b1.price
FROM book b1
WHERE b1.published_date = (
    SELECT MAX(published_date)
    FROM book b2
    WHERE b2.category = b1.category
);
