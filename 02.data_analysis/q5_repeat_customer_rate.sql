USE Olist_Ecommerce;

WITH CustomerOrderCounts AS (
    SELECT 
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS total_orders
    FROM olist_customers_dataset c
    JOIN olist_orders_dataset o 
        ON c.customer_id = o.customer_id
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id
)
SELECT 
    COUNT(*) AS total_unique_customers,
    SUM(CASE WHEN total_orders > 1 THEN 1 ELSE 0 END) AS repeat_customers,
    ROUND(
        CAST(SUM(CASE WHEN total_orders > 1 THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) * 100, 
    2) AS repeat_customer_rate_pct
FROM CustomerOrderCounts;