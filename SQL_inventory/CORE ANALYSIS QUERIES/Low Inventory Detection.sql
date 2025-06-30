-- 3. Low Inventory Detection based on reorder point
-- Purpose: Identify SKUs that need restocking
WITH rop AS (
  SELECT store_id, product_id,
         ROUND(AVG(units_sold) * 3, 0) AS reorder_point
  FROM sales
  WHERE sales_date >= CURRENT_DATE - INTERVAL '7 days'
  GROUP BY store_id, product_id
)
SELECT s.store_id, s.product_id, MAX(s.inventory_level) AS current_stock, r.reorder_point
FROM sales s
JOIN rop r
  ON s.store_id = r.store_id AND s.product_id = r.product_id
GROUP BY s.store_id, s.product_id, r.reorder_point
HAVING MAX(s.inventory_level) < r.reorder_point;
