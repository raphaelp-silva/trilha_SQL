-- faça uma query que apresente o tamanho médio, máximo e minimo do nome do objeto por categoria considerando apenas os objetos que tenham a descricao maior que 100
-- exiba apenas as categorias com tamanho medio de descricao do objeto menor que 500 caracteres
select 
    product_category_name,
    product_description_lenght,
    max(product_name_lenght) as max_name_lenght,
    min(product_name_lenght) as min_name_lenght,
    avg(product_name_lenght) as media_name_lenght,
    avg(product_description_lenght) as media_description_lenght

from tb_products

where product_description_lenght > 100

group by product_category_name

having avg(product_description_lenght) > 500