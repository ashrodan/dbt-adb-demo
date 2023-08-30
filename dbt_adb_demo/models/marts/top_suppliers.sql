with line_items_with_supp_incr as (

    select * from {{ ref('line_items_with_supp_incr') }}

),

top_5_suppliers as (

   select * from {{ ref("top_five_suppliers") }}
),

final as (

    select *,
        date_trunc('YY', shipdate) as year_d

    from line_items_with_supp_incr
    join top_5_suppliers using(suppkey)

)

{# select * from final --order by line_items desc #}

 select
      year_d,
      {{ 
        dbt_utils.pivot(
            'supp_name', 
            dbt_utils.get_column_values(ref('top_five_suppliers'),'suppkey'),
            agg='count',
            then_value='supp_name'
        ) 
      }}
            {# distinct=true #}
    from final
    group by year_d
    order by year_d
