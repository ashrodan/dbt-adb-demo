{% snapshot lineitems_snapshot %}
    {{
        config(
          unique_key='_id',
          strategy='timestamp',
          target_schema = 'dbt_adb_demo',
          updated_at='shipdate'
        )
    }}
    -- Pro-Tip: Use sources in snapshots!
    {# select * from {{ source('jaffle_shop', 'orders') }} #}
    select * from {{ ref('line_items_with_supp') }}
{% endsnapshot %}


