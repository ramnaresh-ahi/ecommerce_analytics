
WITH products AS(
    SELECT
        prod_id,
        prod_cost,
        prod_category,
        prod_name,
        prod_brand,
        prod_retail_price,
        prod_department,
        prod_sku,
        prod_dist_id
    FROM
        {{ ref('stg_products')}}
)

SELECT
    *
FROM
    products