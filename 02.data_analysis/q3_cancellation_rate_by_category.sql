USE Olist_Ecommerce;

SELECT TOP 10
    p.product_category_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(CASE WHEN o.order_status = 'canceled' THEN 1 ELSE 0 END) AS canceled_orders,
    ROUND(CAST(SUM(CASE WHEN o.order_status = 'canceled' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(DISTINCT o.order_id) * 100, 2) AS cancellation_rate_pct
FROM olist_orders_dataset o
JOIN olist_order_items_dataset i 
    ON o.order_id = i.order_id
JOIN olist_products_dataset p 
    ON i.product_id = p.product_id
WHERE p.product_category_name IS NOT NULL
GROUP BY p.product_category_name
HAVING COUNT(DISTINCT o.order_id) > 100 
ORDER BY cancellation_rate_pct DESC;