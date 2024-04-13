with   
    source_employees as (
        select 
            cast(employee_id as int) as employee_id
            , cast(reports_to as int) as manager_id
            , cast(last_name as string) as last_name
            , cast(first_name as string) as first_name
            , cast(first_name  || ' ' || last_name as string) as full_name 
            , cast(birth_date as date) as birth_date
            , cast(hire_date as date) as hire_date
            , address
            , city
            , region
            , postal_code as zip_code
            , country
            , notes
        from {{ source('erp', 'employees') }}
    )

select *
from source_employees