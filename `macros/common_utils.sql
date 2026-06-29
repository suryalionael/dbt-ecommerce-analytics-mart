{% macro unique(column_name) %}
    {{ adapter.quote(column_name) }} IS NOT NULL AND {{ adapter.quote(column_name) }} != ''
{% endmacro %}

{% macro not_null(column_name) %}
    {{ adapter.quote(column_name) }} IS NOT NULL
{% endmacro %}

{% macro accepted_values(column_name, values) %}
    {{ adapter.quote(column_name) }} IN ({{ values | map('quote') | join(', ') }})
{% endmacro %}
