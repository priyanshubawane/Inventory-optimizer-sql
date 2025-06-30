-- Recommend Stock Adjustments

-- Logic: High inventory + low turnover → Reduce | Low inventory + high turnover → Increase


WITH inventory_stats AS (
  SELECT store_id, product_id,
         ROUND(AVG(inventory_level), 2) AS avg_inventory,
         ROUND(SUM(units_sold) / NULLIF(AVG(inventory_level), 0), 2) AS turnover_ratio
  FROM sales
  GROUP BY store_id, product_id
)
SELECT *,
  CASE 
    WHEN avg_inventory > 100 AND turnover_ratio < 0.5 THEN 'Reduce'
    WHEN avg_inventory < 50 AND turnover_ratio > 1 THEN 'Increase'
    ELSE 'Balanced'
  END AS stock_action
FROM inventory_stats;