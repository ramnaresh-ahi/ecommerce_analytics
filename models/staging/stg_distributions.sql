WITH distributions AS(
    SELECT 
        id as dist_id,
        name as dist_name,
        latitude,
        longitude
    FROM 
        {{ source('raw', 'distribution_centers')}}
)

SELECT 
    *
FROM 
    distributions