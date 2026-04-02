-- Price Tier Rankings
-- Ranks books within price tiers using conditional partitioning.
-- Demonstrates use of CASE inside PARTITION BY with ranking functions.

SELECT
    title,
    CASE
        WHEN price < 30 THEN 'Budget'
        WHEN price <= 40 THEN 'Standard'
        ELSE 'Premium'
    END as price_tier,
    price,
    copies_sold,
    RANK() OVER (
        PARTITION BY
            CASE
                WHEN price < 30 THEN 'Budget'
                WHEN price <= 40 THEN 'Standard'
                ELSE 'Premium'
            END
        ORDER BY copies_sold DESC
    ) as tier_rank
FROM book
ORDER BY price_tier, tier_rank;
