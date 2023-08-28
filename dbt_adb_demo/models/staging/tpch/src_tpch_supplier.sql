with source as (

    select * from {{ source('tpch', 'supplier') }}

)
, final as (

    select 
        s_suppkey as suppkey, 
        s_name as supp_name
    from source

)

select * from final
