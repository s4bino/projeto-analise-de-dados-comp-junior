SELECT seller_id as vendedores, COUNT(order_status) AS numero_pedidos_cancelados
FROM olist_orders_dataset o JOIN olist_order_items_dataset oi
ON o.order_id = oi.order_id
WHERE order_status = 'canceled'
GROUP BY seller_id
ORDER BY numero_pedidos_cancelados DESC
LIMIT 5