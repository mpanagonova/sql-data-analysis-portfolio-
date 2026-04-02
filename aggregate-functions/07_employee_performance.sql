-- Employee Performance
-- Evaluates manager performance by analyzing team size and total team sales.
-- Demonstrates self-join and aggregation to model hierarchical relationships.

SELECT 
    m.name as manager_name,
    COUNT(DISTINCT e.id) as team_size,
    SUM(s.amount) as total_team_sales,
    ROUND(SUM(s.amount) / COUNT(DISTINCT e.id), 2) as avg_sale_per_member
FROM employee m
INNER JOIN employee e ON e.manager_id = m.id
INNER JOIN sale s ON s.employee_id = e.id
GROUP BY m.id, m.name
ORDER BY total_team_sales DESC;
