with
    products as(
        select *
        from {{ ref('stg_erp__products') }}
    )

    , categories as (
        select *
        from {{ ref('stg_erp__categories') }}
    )

    , suppliers as (
        select *
        from {{ ref('stg_erp__suppliers') }}
    )

    , join_tables as (
        select
              p.product_id
            , p.category_id
            , p.supplier_id
            , p.product_name
            , p.quantity_per_unit
            , p.unit_price
            , p.units_in_stock
            , p.units_on_order
            , p.reorder_level
            , c.category_name
            , c.description
            , s.company_name as supplier_company_name
            , s.contact_title as supplier_contact_title
            , s.address as supplier_address
            , s.city as supplier_city
            , s.region as supplier_region
            , s.postal_code as supplier_zip_code
            , s.country as supplier_country
        from products p
        left join categories c on p.category_id = c.category_id
        left join suppliers s on p.supplier_id = s.supplier_id
    )

    select *
    from join_tables
    