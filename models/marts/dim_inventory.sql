
WITH inventory AS(
    SELECT
        *
    FROM
        {{ref('int_inventory')}}
)

SELECT
    *
FROM
    inventory