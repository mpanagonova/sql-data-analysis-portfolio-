-- Customer Contact List
-- Formats customer contact data by standardizing names, emails, and phone numbers.
-- Demonstrates string functions, data cleaning, and null handling.

SELECT
    CONCAT(
        INITCAP(first_name),
        ' ',
        INITCAP(last_name)
    ) as full_name,
    LOWER(email) as email,
    COALESCE(
        REGEXP_REPLACE(
            TRIM(phone),
            '[^0-9]',
            '',
            'g'
        ),
        'No phone'
    ) as phone
FROM customer
ORDER BY id;
