-- Membership Duration
-- Calculates membership length in months and assigns a membership tier.
-- Demonstrates use of date functions and CASE expressions for business classification.

SELECT
    name,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, join_date)) * 12 +
    EXTRACT(MONTH FROM AGE(CURRENT_DATE, join_date)) AS months,
    CASE
        WHEN AGE(CURRENT_DATE, join_date) < INTERVAL '6 months' THEN 'Bronze'
        WHEN AGE(CURRENT_DATE, join_date) < INTERVAL '12 months' THEN 'Silver'
        WHEN AGE(CURRENT_DATE, join_date) < INTERVAL '24 months' THEN 'Gold'
        ELSE 'Platinum'
    END AS tier
FROM member
ORDER BY months DESC;
