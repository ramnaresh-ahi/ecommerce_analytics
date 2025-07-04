
WITH users AS(
    SELECT 
        user_id,
        email,
        age,
        CASE
            WHEN gender = 'M' THEN 'Male'
            WHEN gender = 'F' THEN 'Female'
            ELSE 'Unknown'
            END AS gender,
        city,
        state,
        country,
        latitude,
        longitude,
        traffic_source,
        created_at
    FROM
        {{ ref('stg_users')}}

)

SELECT
    *
FROM
    users