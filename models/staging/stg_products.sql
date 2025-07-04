
WITH products AS(
    SELECT 
        id as prod_id,
        cost as prod_cost,
        category as prod_category,
        name as prod_name,
        brand as prod_brand,
        retail_price as prod_retail_price,
        department as prod_department,
        sku as prod_sku,
        distribution_center_id as prod_dist_id
    FROM
        {{ source('raw', 'products')}}
)

SELECT
    *
FROM
    products