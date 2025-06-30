-- Inventory Jump Detection

-- Detect anomalies where inventory jumped > 200 units in a day

SELECT store_id, product_id, sales_date,
       LAG(inventory_level) OVER(PARTITION BY store_id, product_id ORDER BY sales_date) AS prev_day_inventory,
       inventory_level,
       (inventory_level - LAG(inventory_level) OVER(PARTITION BY store_id, product_id ORDER BY sales_date)) AS diff
FROM sales
QUALIFY ABS(diff) > 200;