with 
    employees as (
        select *
        from {{ ref('dim_employees') }}
    )

    ,    products as (
        select *
        from {{ ref('dim_products') }}
    )

    ,    order_items as (
        select *
        from {{ ref('int_sales__order_items') }}
    )

    , joined as (
        select
        o.pk_sales
        , o.order_id
        , p.product_id
        , e.employee_id
        , o.unit_price
        , o.quantity
        , o.discount
        , o.order_date
        , o.shipped_date
        , e.full_name as employee_full_name
        , e.manager_name
        , p.product_name
        , p.category_name
        , p.supplier_company_name
        from order_items o
        left join products p on o.product_id = p.product_id
        left join employees e on o.employee_id = e.employee_id 
    )

    , transformations as(
        select
        *
        , (unit_price * quantity) as gross_value
        , (unit_price * quantity) * (1-discount) as net_value
        from joined
    )

select *
from transformations