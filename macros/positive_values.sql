
-- macros/greatest_value_check.sql
{% macro test_greater_than_zero(model, column_name) %}
SELECT *
FROM {{ model }}
WHERE {{ column_name }} <= 0
{% endmacro %}
