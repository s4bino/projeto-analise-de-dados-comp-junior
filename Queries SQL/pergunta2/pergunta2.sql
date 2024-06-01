SELECT c.customer_state AS estado,
	ROUND(AVG(julianday(o.order_delivered_customer_date) - julianday(o.order_purchase_timestamp)),2) AS tempo_medio_entrega_em_dias
FROM olist_orders_dataset AS o JOIN olist_customers_dataset AS c 
ON o.customer_id = c.customer_id
WHERE order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY tempo_medio_entrega_em_dias



