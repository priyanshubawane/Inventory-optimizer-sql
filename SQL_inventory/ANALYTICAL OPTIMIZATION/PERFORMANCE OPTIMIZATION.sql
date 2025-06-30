-- =============================================

-- SECTION 2: PERFORMANCE OPTIMIZATION

-- =============================================


-- Indexing key columns for faster joins and filters
CREATE INDEX idx_sales_store_product ON sales(store_id, product_id);
CREATE INDEX idx_sales_date ON sales(sales_date);
