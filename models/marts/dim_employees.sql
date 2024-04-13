with
    erp_employees as (
        select
              employee_id
            , manager_id
            , last_name
            , first_name
            , full_name 
            , birth_date
            , hire_date
            , address
            , city
            , region
            , zip_code
            , country
            , notes
        from {{ ref('stg_erp__employees') }}
    )

    , erp_managers as (
        select *
        from {{ ref('stg_erp__employees') }}
    )

    , join_employee_to_managers as (
        select
            e.employee_id
            , e.manager_id
            , e.last_name
            , e.first_name
            , e.full_name 
            , m.full_name as manager_name
            , e.birth_date
            , e.hire_date
            , e.address
            , e.city
            , e.region
            , e.zip_code
            , e.country
            , e.notes
        from erp_employees e
        left join erp_managers m on e.manager_id =  m.employee_id

    )

select *
from join_employee_to_managers
