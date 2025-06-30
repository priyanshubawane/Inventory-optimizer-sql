--  Summary Report: KPI  

-- Average Inventory Levels

SELECT store_id, product_id,
       ROUND(AVG(inventory_level), 2) AS avg_inventory
FROM sales
GROUP BY store_id, product_id;
