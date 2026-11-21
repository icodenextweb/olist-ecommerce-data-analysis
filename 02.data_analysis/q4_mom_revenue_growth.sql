USE Olist_Ecommerce;

WITH MonthlyRevenue AS (
    SELECT 
        FORMAT(o.order_purchase_timestamp, 'yyyy-MM') AS order_month,
        ROUND(SUM(i.price), 2) AS total_revenue
    FROM olist_orders_dataset o
    JOIN olist_order_items_dataset i 
        ON o.order_id = i.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY FORMAT(o.order_purchase_timestamp, 'yyyy-MM')
)
SELECT 
    order_month,
    total_revenue,
    LAG(total_revenue) OVER (ORDER BY order_month) AS prev_month_revenue,
    ROUND(
        (total_revenue - LAG(total_revenue) OVER (ORDER BY order_month)) 
        / NULLIF(LAG(total_revenue) OVER (ORDER BY order_month), 0) * 100, 
    2) AS mom_growth_pct
FROM MonthlyRevenue
ORDER BY order_month;