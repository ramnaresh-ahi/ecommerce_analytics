
WITH order_items AS(
    SELECT
        order_item_id,
        order_id,
        user_id,
        prod_id,
        inventory_id,
        status,
        created_at,
        shipped_at,
        returned_at,
        sale_price
    FROM
        {{ ref('stg_order_items')}}
)

SELECT
    *
FROM
    order_items