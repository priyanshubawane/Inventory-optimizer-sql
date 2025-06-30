-- Seasonal/Cyclical Trends Forecasting

-- Purpose: Analyze demand by seasonality label

SELECT seasonality,
       SUM(units_sold) AS total_sales
FROM sales
GROUP BY seasonality
ORDER BY total_sales DESC;
