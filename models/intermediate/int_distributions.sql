
WITH distributions AS(
    SELECT
        dist_id,
        dist_name,
        latitude,
        longitude
    FROM
        {{ref('stg_distributions')}}
)

SELECT
    *
FROM
    distributions