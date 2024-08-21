-- lista das categorias por ordem alfabetica

select 
    distinct    case when product_category_name is null then 'Outros'
                    else product_category_name
                end as categoria_fillna

from tb_products 
order by product_category_name