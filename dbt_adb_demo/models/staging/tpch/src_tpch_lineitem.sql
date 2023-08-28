with source as (

    select * from {{ source('tpch', 'lineitem') }}

)
, final as (

    select 
        l_orderkey as orderkey,
        l_partkey as partkey, 
        l_suppkey as suppkey,
        l_shipdate as shipdate
    from source

)

select * from final
