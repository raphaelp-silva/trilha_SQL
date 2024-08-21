-- faça uma query que apresente o tamanho médio, máximo e minimo da descricao do objeto por categoria
select 
    product_category_name,
    count(*) as qte_products,
    max(product_description_lenght) as max_description,
    min(product_description_lenght) as min_description,
    avg(product_description_lenght) as media_description

from tb_products

group by product_category_name