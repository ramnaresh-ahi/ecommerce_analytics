
WITH order_items AS(
    SELECT
        *
    FROM
        {{ ref('int_order_items')}}
)

SELECT
    *
FROM
    order_items