USE retail_sales_analysis;

-- Basic sales numbers
SELECT 
    COUNT(*) AS total_rows
FROM raw_orders;

SELECT 
    ROUND(SUM(net_sales), 2) AS total_revenue
FROM raw_orders;

SELECT 
    ROUND(SUM(profit), 2) AS total_profit
FROM raw_orders;

SELECT 
    SUM(quantity) AS total_units_sold
FROM raw_orders;


-- Monthly sales performance
SELECT
    month_num,
    month,
    ROUND(SUM(net_sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit
FROM raw_orders
GROUP BY month_num, month
ORDER BY month_num;


-- Sales by channel
SELECT
    sales_channel,
    COUNT(*) AS orders,
    ROUND(SUM(net_sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit
FROM raw_orders
GROUP BY sales_channel
ORDER BY revenue DESC;


-- Customer segment performance
SELECT
    customer_segment,
    COUNT(*) AS orders,
    ROUND(SUM(net_sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit,
    ROUND(SUM(profit) / NULLIF(SUM(net_sales), 0) * 100, 2) AS profit_margin_pct
FROM raw_orders
GROUP BY customer_segment
ORDER BY revenue DESC;


-- State performance
SELECT
    state,
    COUNT(*) AS orders,
    ROUND(SUM(net_sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit,
    ROUND(SUM(profit) / NULLIF(SUM(net_sales), 0) * 100, 2) AS profit_margin_pct
FROM raw_orders
GROUP BY state
ORDER BY revenue DESC;


-- Category performance
SELECT
    category,
    COUNT(*) AS orders,
    SUM(quantity) AS units_sold,
    ROUND(SUM(net_sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit,
    ROUND(SUM(profit) / NULLIF(SUM(net_sales), 0) * 100, 2) AS profit_margin_pct
FROM raw_orders
GROUP BY category
ORDER BY revenue DESC;


-- Top 10 products by profit
SELECT
    product_name,
    category,
    SUM(quantity) AS units_sold,
    ROUND(SUM(net_sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit
FROM raw_orders
GROUP BY product_name, category
ORDER BY profit DESC
LIMIT 10;


-- Top 10 products by revenue
SELECT
    product_name,
    category,
    SUM(quantity) AS units_sold,
    ROUND(SUM(net_sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit
FROM raw_orders
GROUP BY product_name, category
ORDER BY revenue DESC
LIMIT 10;


-- Categories with lower margins
SELECT
    category,
    ROUND(SUM(net_sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit,
    ROUND(SUM(profit) / NULLIF(SUM(net_sales), 0) * 100, 2) AS profit_margin_pct
FROM raw_orders
GROUP BY category
ORDER BY profit_margin_pct ASC;


-- Customer counts
SELECT
    customer_segment,
    COUNT(DISTINCT customer_id) AS customers,
    ROUND(SUM(net_sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit
FROM raw_orders
GROUP BY customer_segment
ORDER BY customers DESC;


-- Payment method performance
SELECT
    payment_method,
    COUNT(*) AS orders,
    ROUND(SUM(net_sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit
FROM raw_orders
GROUP BY payment_method
ORDER BY revenue DESC;


-- Order status
SELECT
    order_status,
    COUNT(*) AS orders,
    ROUND(SUM(net_sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit
FROM raw_orders
GROUP BY order_status
ORDER BY orders DESC;


-- Returns
SELECT
    return_flag,
    COUNT(*) AS orders,
    ROUND(SUM(net_sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit
FROM raw_orders
GROUP BY return_flag
ORDER BY return_flag;


-- Main return reasons
SELECT
    return_reason,
    COUNT(*) AS returned_orders
FROM raw_orders
WHERE return_flag = 1
GROUP BY return_reason
ORDER BY returned_orders DESC;


-- Discount and margin
SELECT
    CASE
        WHEN discount_pct = 0 THEN 'No Discount'
        WHEN discount_pct <= 10 THEN '1-10%'
        WHEN discount_pct <= 20 THEN '11-20%'
        WHEN discount_pct <= 30 THEN '21-30%'
        ELSE '30%+'
    END AS discount_band,
    COUNT(*) AS orders,
    ROUND(SUM(net_sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit,
    ROUND(SUM(profit) / NULLIF(SUM(net_sales), 0) * 100, 2) AS profit_margin_pct
FROM raw_orders
GROUP BY discount_band
ORDER BY profit_margin_pct DESC;


-- Delivery performance
SELECT
    delivery_status,
    COUNT(*) AS orders,
    ROUND(AVG(shipping_days), 2) AS avg_shipping_days,
    ROUND(SUM(net_sales), 2) AS revenue
FROM raw_orders
GROUP BY delivery_status
ORDER BY orders DESC;


-- Quarterly performance
SELECT
    quarter,
    ROUND(SUM(net_sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit,
    ROUND(SUM(profit) / NULLIF(SUM(net_sales), 0) * 100, 2) AS profit_margin_pct
FROM raw_orders
GROUP BY quarter
ORDER BY quarter;


-- Highest profit category
SELECT
    category,
    ROUND(SUM(profit), 2) AS total_profit
FROM raw_orders
GROUP BY category
ORDER BY total_profit DESC
LIMIT 1;


-- Highest profit state
SELECT
    state,
    ROUND(SUM(profit), 2) AS total_profit
FROM raw_orders
GROUP BY state
ORDER BY total_profit DESC
LIMIT 1;


-- Overall summary
ALTER TABLE raw_orders
CHANGE COLUMN `ï»¿order_id` order_id TEXT;
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT order_id) AS unique_orders,
    ROUND(SUM(net_sales), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_units,
    ROUND(AVG(net_sales), 2) AS average_order_value,
    ROUND(SUM(profit) / NULLIF(SUM(net_sales), 0) * 100, 2) AS profit_margin_pct
FROM raw_orders;
SELECT
    order_status,
    COUNT(*) AS total_records,
    COUNT(DISTINCT order_id) AS unique_orders,
    ROUND(SUM(net_sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit
FROM raw_orders
GROUP BY order_status
ORDER BY total_records DESC;
SELECT
    COUNT(DISTINCT order_id) AS delivered_orders,
    ROUND(SUM(net_sales), 2) AS delivered_revenue,
    ROUND(SUM(profit), 2) AS delivered_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(net_sales), 0) * 100,
        2
    ) AS profit_margin_pct
FROM raw_orders
WHERE order_status = 'Delivered';
SELECT
    ROUND(SUM(gross_sales), 2) AS gross_sales,
    ROUND(SUM(discount_amount), 2) AS discounts,
    ROUND(SUM(net_sales), 2) AS net_sales,
    ROUND(SUM(cost), 2) AS cost,
    ROUND(SUM(profit), 2) AS profit
FROM raw_orders;
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT order_id) AS unique_orders,
    COUNT(DISTINCT customer_id) AS unique_customers,
    ROUND(SUM(net_sales), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(net_sales), 0) * 100,
        2
    ) AS profit_margin_pct
FROM raw_orders;