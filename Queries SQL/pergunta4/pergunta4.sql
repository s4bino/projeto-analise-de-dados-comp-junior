WITH VendasPorCategoriaMes AS (
    SELECT 
        p.product_category_name AS categoria,
        strftime('%Y-%m', o.order_purchase_timestamp) AS mes,
        SUM(oi.price) AS total_vendas
    FROM 
        olist_order_items_dataset oi
    JOIN 
        olist_orders_dataset o ON oi.order_id = o.order_id
    JOIN 
        olist_products_dataset p ON oi.product_id = p.product_id
    GROUP BY 
        p.product_category_name, strftime('%Y-%m', o.order_purchase_timestamp)
)
SELECT 
    categoria,
    mes,
    total_vendas,
    ROUND(
        ((total_vendas - COALESCE(LAG(total_vendas) OVER (PARTITION BY categoria ORDER BY mes), 0)) / 
            COALESCE(NULLIF(LAG(total_vendas) OVER (PARTITION BY categoria ORDER BY mes), 0), 1)
        ) * 100,  2) AS variacao_percentual
FROM 
    VendasPorCategoriaMes
ORDER BY 
    categoria, mes;
