-- Qual o peso medio dos produtos vendidos por sellers de cada estados?
-- Considere apenas o ano de 2017 e pedidos entregues nesta analise

select 
        t3.seller_state,
        avg(t1.product_weight_g) as avg_peso_produtos

from tb_products as t1 

left join tb_order_items as t2
on t1.product_id = t2.product_id

left join tb_sellers as t3
on t2.seller_id = t3.seller_id

left join tb_orders as t4
on t2.order_id = t4.order_id

where t4.order_status = 'delivered'
and strftime('%Y',t4.order_approved_at) = '2017'

group by t3.seller_state