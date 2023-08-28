with source as (

    select * from {{ source('tpch', 'part') }}

)
, final as (

    select 
        p_partkey as partkey, 
        p_name as part_name
    from source

)

select * from final
