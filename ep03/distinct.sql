-- lista das categorias por ordem alfabetica

select distinct product_category_name

from tb_products

where product_category_name is not null

order by product_category_name