

-- 2. Reorder Point Estimation using historical trend
-- Purpose: Calculate ROP as 7-day average demand * 3 (lead time)
SELECT store_id, product_id,
       ROUND(AVG(units_sold) * 3, 0) AS reorder_point
FROM sales
WHERE sales_date >= CURRENT_DATE - INTERVAL '7 days'
GROUP BY store_id, product_id;
