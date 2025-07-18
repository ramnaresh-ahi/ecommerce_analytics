
WITH orders AS(
    SELECT
        order_id,
        user_id,
        gender,
        status,
        created_at,
        shipped_at,
        returned_at,
        delivered_at,
        num_of_item
    FROM
        {{ref('stg_orders')}}
)

SELECT
    *
FROM
    orders