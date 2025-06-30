-- 4. Inventory Turnover Analysis
-- Purpose: Evaluate how efficiently inventory is being sold
SELECT store_id, product_id,
       ROUND(SUM(units_sold) / NULLIF(AVG(inventory_level), 0), 2) AS turnover_ratio
FROM sales
GROUP BY store_id, product_id
ORDER BY turnover_ratio ASC;