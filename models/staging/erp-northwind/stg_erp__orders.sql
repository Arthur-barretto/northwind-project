with
    source_orders as (
        select
            cast(order_id as int) as order_id
            , cast(customer_id  as string) as customer_id
            , cast(employee_id as int) as employee_id
            , cast(order_date as date) as order_date
            , cast(required_date as date) as required_date
            , cast(shipped_date as date) as shipped_date
            , cast(ship_via as int) as ship_via
            , cast(freight as numeric) as freight
            , cast(ship_name as string) as ship_name
        from {{ source('erp', 'orders') }}
    )

select *
from source_orders

