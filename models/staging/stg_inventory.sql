
WITH inventory AS(
    SELECT 
        id as inventory_id,
        product_id as prod_id,
        created_at,
        sold_at,
        cost,
        product_category as prod_category,
        product_name as prod_name,
        product_brand as prod_brand,
        product_retail_price as prod_retail_price,
        product_department as prod_department,
        product_sku as prod_sku,
        product_distribution_center_id as prod_dist_id
    FROM
        {{ source('raw', 'inventory_items')}}
)

SELECT
    *
FROM
    inventory