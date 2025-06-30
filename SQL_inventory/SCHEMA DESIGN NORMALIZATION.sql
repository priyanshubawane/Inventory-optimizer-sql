-- =============================================================

-- Inventory Optimization Using SQL for Urban Retail Co.
-- Author: Priyanshu Keshav Bawane

-- =============================================

-- SECTION 1: SCHEMA DESIGN & NORMALIZATION

-- =============================================
-- Creating normalized tables


-- Dimension Table: product_master
CREATE TABLE product_master (
    product_id VARCHAR(20) PRIMARY KEY,
    category VARCHAR(50),
    seasonality VARCHAR(20)
);

-- Dimension Table: store_master
CREATE TABLE store_master (
    store_id VARCHAR(20) PRIMARY KEY,
    region VARCHAR(50)
);

-- Fact Table: sales
CREATE TABLE sales (
    sales_date DATE,
    store_id VARCHAR(20),
    product_id VARCHAR(20),
    inventory_level INT,
    units_sold INT,
    units_ordered INT,
    demand_forecast INT,
    price NUMERIC(10,2),
    discount NUMERIC(5,2),
    weather_condition VARCHAR(50),
    holiday_promotion BOOLEAN,
    competitor_pricing NUMERIC(10,2),
    FOREIGN KEY (store_id) REFERENCES store_master(store_id),
    FOREIGN KEY (product_id) REFERENCES product_master(product_id)
);
