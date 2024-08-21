-- Quantos vendedores a empressa possui nos estados de SP, RJ e PR?
select 
    seller_state, 
    count(*) as qte_sellers
from tb_sellers

-- filtro pré agg (agregacao)
where seller_state IN ('SP', 'RJ', 'PR')

-- agregacao 
group by seller_state 

-- filtro pós agg
having count(*) > 10 --remove estados com menos de 10 sellers 