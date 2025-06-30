--  Discount vs Sales Analysis

-- Does higher discount result in higher sales?

SELECT ROUND(discount, 2) AS discount_pct,
       ROUND(AVG(units_sold), 2) AS avg_units_sold
FROM sales
GROUP BY ROUND(discount, 2)
ORDER BY discount_pct;
