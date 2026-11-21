USE Olist_Ecommerce;

WITH CustomerSpend AS (
    SELECT 
        c.customer_unique_id,
        SUM(i.price) AS total_spend
    FROM olist_customers_dataset c
    JOIN olist_orders_dataset o 
        ON c.customer_id = o.customer_id
    JOIN olist_order_items_dataset i 
        ON o.order_id = i.order_id
    GROUP BY c.customer_unique_id
)
SELECT TOP 10
    customer_unique_id,
    total_spend,
    RANK() OVER (ORDER BY total_spend DESC) as spend_rank
FROM CustomerSpend;