{% macro get_where_subquery(relation) -%}
    {% do return(adapter.dispatch('get_where_subquery')(relation)) %}
{%- endmacro %}

{% macro default__get_where_subquery(relation) -%}
    {%- set where = config.get('where', '') -%}
    {%- if where -%}
        (select * from {{ relation }} where {{ where }}) dbt_subquery
    {%- else -%}
        {{ relation }}
    {%- endif -%}
{%- endmacro %}
