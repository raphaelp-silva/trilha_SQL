-- Filtrar sellers que não vende há mais de 90 dias para enviar um mailing incentivando à vender conscosco! 
drop table if exists tb_audiencia_venda;
create table tb_audiencia_venda as 
with tb_marcacao_seller as (

select t2.seller_id,
        max(t1.order_approved_at) as dt_ult_venda,
        '2018-07-01' as dt_atual,

        -- isso é o que o marketing quer! disparar mailing para seller que nao vende há mais de 90 dias
        julianday ('2018-07-01') - julianday(max(t1.order_approved_at)) as dif_data_ult_venda,
        case when  julianday ('2018-07-01') - julianday(max(order_approved_at)) > 90 
            then 1 else 0
            end as flag_venda_90_dias,

        -- isso é a nossa proposta (mais inteligente, utilizando a média de cada vendedor) para decidir se envia ou não o mailing 
        t3.tempo_medio_venda,

        case when julianday ('2018-07-01') - julianday(max(t1.order_approved_at)) > t3.tempo_medio_venda
            then 1 else 0 
            end as flag_avg_tempo

from tb_orders as t1

left join tb_order_items as t2
on t1.order_id = t2.order_id 

left join tb_avg_compra_seller as t3
on t2.seller_id = t3.seller_id

where date(t1.order_approved_at) < '2018-07-01'
and t1.order_status = 'delivered'

group by t2.seller_id
)
select seller_id,
       case when abs(random()%1000) / 1000. <= 0.1 then 1 else 0
       end as flag_controle

from tb_marcacao_seller
where flag_avg_tempo = 1;