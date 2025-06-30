--  Summary Report: KPI 

-- Forecast Error

SELECT store_id, product_id,
       ROUND(AVG(ABS(units_sold - demand_forecast)), 2) AS avg_forecast_error
FROM sales
WHERE demand_forecast IS NOT NULL
GROUP BY store_id, product_id
ORDER BY avg_forecast_error DESC;
