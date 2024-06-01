WITH PedidosPorEstado AS (
    SELECT
        c.customer_state,
        COUNT(order_id) AS num_pedidos
    FROM
        olist_orders_dataset o JOIN olist_customers_dataset c ON o.customer_id = c.customer_id
    GROUP BY
        c.customer_state
),
TempoMedioEntregaPorEstado AS(
SELECT 
	c.customer_state AS estado,
	ROUND(AVG(julianday(o.order_delivered_customer_date) - julianday(o.order_purchase_timestamp)),2) AS tempo_medio_entrega_em_dias
FROM 
	olist_orders_dataset AS o JOIN olist_customers_dataset AS c ON o.customer_id = c.customer_id
WHERE 
	order_status = 'delivered'
GROUP BY 
	c.customer_state
)
SELECT
    p.customer_state,
    ROUND(p.num_pedidos / t.tempo_medio_entrega_em_dias, 2) AS relacao_pedidos_tempo
FROM
    PedidosPorEstado p JOIN TempoMedioEntregaPorEstado t ON p.customer_state = t.estado
ORDER BY
    relacao_pedidos_tempo DESC



