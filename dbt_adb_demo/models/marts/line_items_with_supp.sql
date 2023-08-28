with lineitem as (

    select * from {{ ref('src_tpch_lineitem') }}

)

, part_supp as (

    select * from {{ ref('src_tpch_part_supp') }}

)

, part as (

    select * from {{ ref('src_tpch_part') }}

)

, supplier as (

    select * from {{ ref('src_tpch_supplier') }}

)

, final as (

    select *
    from lineitem
    left join part_supp using(partkey, suppkey)
    left join part using(partkey)
    left join supplier using(suppkey)

)

select * from final 
