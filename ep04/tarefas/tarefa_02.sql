-- Qual o valor total de receita por vendedor por estado?
-- Considere a base completa, apenas com pedidor entregues

select t3.seller_state,
        sum(t2.price) as receita_total

from tb_orders as t1

left join tb_order_items as t2
on t1.order_id = t2.order_id

left join tb_sellers as t3
on t2.seller_id = t3.seller_id

where order_status = 'delivered'

group by t3.seller_state