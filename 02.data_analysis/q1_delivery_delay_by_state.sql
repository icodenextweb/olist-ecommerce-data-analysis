USE Olist_Ecommerce;

SELECT 
    c.customer_state,
    AVG(DATEDIFF(day, o.order_estimated_delivery_date, o.order_delivered_customer_date)) as avg_delay_days
FROM olist_orders_dataset o
JOIN olist_customers_dataset c 
    ON o.customer_id = c.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL 
  AND o.order_estimated_delivery_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY avg_delay_days DESC;