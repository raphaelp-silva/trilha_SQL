-- faça uma query que apresente o tamanho médio, máximo e minimo do nome do objeto por categoria
select 
    product_category_name,
    count(*) as qte_products,
    max(product_name_lenght) as max_name_lenght,
    min(product_name_lenght) as min_name_lenght,
    avg(product_name_lenght) as media_name_lenght

from tb_products

group by product_category_name