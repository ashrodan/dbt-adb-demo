with source as (

    select * from {{ source('tpch', 'lineitem') }}

)
, final as (

    select 
        l_partkey as partkey, 
        l_suppkey as suppkey
    from source

)

select * from final
