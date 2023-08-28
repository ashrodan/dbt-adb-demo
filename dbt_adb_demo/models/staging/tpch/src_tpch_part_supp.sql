with source as (

    select * from {{ source('tpch', 'partsupp') }}

)
, final as (

    select 
        ps_partkey as partkey, 
        ps_suppkey as suppkey
    from source

)

select * from final
