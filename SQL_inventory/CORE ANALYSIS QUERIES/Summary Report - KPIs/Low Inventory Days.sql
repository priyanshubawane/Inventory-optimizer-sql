--  Summary Report: KPI 

--Low Inventory Days


WITH rop AS (
  SELECT store_id, product_id,
         ROUND(AVG(units_sold) * 3, 0) AS reorder_point
  FROM sales
  WHERE sales_date >= CURRENT_DATE - INTERVAL '7 days'
  GROUP BY store_id, product_id
)
SELECT s.store_id, s.product_id,
       COUNT(*) AS low_inventory_days
FROM sales s
JOIN rop r ON s.store_id = r.store_id AND s.product_id = r.product_id
WHERE s.inventory_level < r.reorder_point
GROUP BY s.store_id, s.product_id;