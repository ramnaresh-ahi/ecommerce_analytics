
WITH orders AS(
    SELECT
        *
    FROM
        {{ ref('int_orders')}}
)

SELECT
    *
FROM
    orders