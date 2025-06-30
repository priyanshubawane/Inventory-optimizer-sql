-- Identify Fast-selling vs. Slow-moving Products


SELECT product_id,
       SUM(units_sold) AS total_units_sold
FROM sales
GROUP BY product_id
ORDER BY total_units_sold DESC;
