
WITH  products AS(
    SELECT
        *
    FROM
        {{ ref('int_products')}}
)

SELECT
    *
FROM
    products