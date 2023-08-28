
{{ config(
    materialized='incremental',
    file_format='delta',
    unique_key='_id',
    incremental_strategy='merge'
) }}


with source as (

    select * from {{ ref('line_items_with_supp') }}

)

select * from source

{% if is_incremental() %}
    where shipdate >= (select max(shipdate) from source)
{% endif %}
