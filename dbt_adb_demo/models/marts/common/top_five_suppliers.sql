with line_items_with_supp_incr as (

    select * from {{ ref('line_items_with_supp_incr') }}

),

final as (

    select suppkey, 
        count(1) as line_items
    from line_items_with_supp_incr
    group by suppkey
    order by line_items
    limit {{ var('top_limit') }}
)

select * from final
