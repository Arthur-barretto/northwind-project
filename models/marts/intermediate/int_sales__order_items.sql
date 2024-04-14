with 
    orders as(
        select *
        from {{ ref('stg_erp__orders') }}
    )

    , order_items as(
        select *
        from {{ ref('stg_erp__orders_details') }}
    )

    ,join_order_items as(
        select 
            o.order_id
            , o.employee_id
            , o.customer_id
            , o.ship_via
            , i.product_id

            , i.discount
            , i.quantity
            , i.unit_price

            , o.order_date
            , o.shipped_date
        from order_items i
        left join orders o on i.order_id = o.order_id
    )

    , sales_keys as(
        select 
            cast(order_id || ' ' || product_id as string) as pk_sales
            ,*
        from join_order_items
    )

select *
from sales_keys