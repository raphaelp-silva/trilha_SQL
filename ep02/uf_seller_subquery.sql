-- Quantos vendedores a empressa possui nos estados de SP, RJ e PR?
select * 

from (
    select 
        seller_state, 
        count(*) as qte_sellers
    from tb_sellers
    -- where seller_state IN ('SP', 'RJ', 'PR')

    group by seller_state 
    )
where qte_sellers > 10