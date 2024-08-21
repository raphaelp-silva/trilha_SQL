select 
    product_category_name,
    count(*) as qte_products,
    max(product_weight_g) as maximo_peso,
    min(product_weight_g) as minimo_peso,
    avg(product_weight_g) as media_de_peso 

from tb_products

where product_category_name is not null 

group by product_category_name