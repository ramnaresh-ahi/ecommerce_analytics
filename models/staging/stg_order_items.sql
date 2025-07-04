
WITH order_items AS(
    SELECT
        id as order_item_id,
        order_id,
        user_id,
        product_id as prod_id,
        inventory_item_id as inventory_id,
        status,
        created_at,
        shipped_at,
        returned_at,
        sale_price
    FROM
        {{ source('raw', 'order_items')}}
)

SELECT 
    *
FROM
    order_items