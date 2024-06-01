SELECT customer_id as clientes, SUM(price) as valor_gasto
FROM olist_orders_dataset o JOIN olist_order_items_dataset oi
ON o.order_id = oi.order_id
GROUP BY customer_id
ORDER BY valor_gasto DESC
LIMIT 10




