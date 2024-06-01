SELECT p.product_category_name AS categoria_produto, SUM(oi.price) AS receita_total_por_categoria
FROM olist_products_dataset AS p JOIN olist_order_items_dataset AS oi 
ON p.product_id = oi.product_id
GROUP BY p.product_category_name


