--  Supplier Performance (Mocked from competitor_pricing as a proxy)


SELECT product_id,
       ROUND(AVG(competitor_pricing), 2) AS avg_competitor_price
FROM sales
GROUP BY product_id
ORDER BY avg_competitor_price;