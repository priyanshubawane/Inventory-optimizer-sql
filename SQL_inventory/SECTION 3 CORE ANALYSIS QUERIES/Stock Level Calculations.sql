-- =============================================
-- SECTION 3: CORE ANALYSIS QUERIES
-- =============================================

-- 1. Stock Level Calculations across stores and warehouse
-- Purpose: Check current stock levels grouped by store & product
SELECT store_id, product_id,
       MAX(inventory_level) AS current_stock
FROM sales
GROUP BY store_id, product_id;
