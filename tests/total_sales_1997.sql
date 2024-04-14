{{
    config(
        severity='error'
    )
}}

with 
    sales_in_1997 as (
        select sum(gross_value) as total_sales
        from {{ ref('fct_sales') }}
        where order_date between '1997-01-01' and '1997-12-31'
)

select total_sales
from sales_in_1997
where total_sales not between 658388.00 and 658389.00