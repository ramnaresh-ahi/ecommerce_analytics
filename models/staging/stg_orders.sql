
WITH orders AS(
    SELECT
        order_id,
        user_id,
        gender as status,
        status as gender,
        created_at,
        shipped_at,
        returned_at,
        delivered_at,
        num_of_item
    FROM
        {{ source('raw', 'orders_v2')}}

)

SELECT
    *
FROM
    orders