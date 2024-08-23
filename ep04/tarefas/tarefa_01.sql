-- Qual o valor total de receita gerada por clientes de cada estado?
-- Considere a base completa, com apenas pedidos entregues 

select 
    t3.customer_state,
    sum(t2.price) / count(distinct t1.customer_id) as av_receita_cliente 
from tb_orders as t1 

left join tb_order_items as t2
on t1.order_id = t2.order_id 

left join tb_customers as t3
on t1.customer_id = t3.customer_id 

where t1.order_status = 'delivered'

group by t3.customer_state
