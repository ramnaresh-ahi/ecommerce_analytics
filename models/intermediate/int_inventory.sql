
WITH inventory AS(
    SELECT
        inventory_id,
        prod_id,
        created_at,
        sold_at,
        cost,
        prod_category,
        prod_name,
        prod_brand,
        prod_retail_price,
        prod_department,
        prod_sku,
        prod_dist_id
    FROM
        {{ ref('stg_inventory')}}
)

SELECT 
    *
FROM
    inventory