
WITH users AS(
    SELECT
        id as user_id,
        first_name,
        last_name,
        email,
        age, 
        gender,
        street_address,
        postal_code,
        city,
        state,
        country,
        latitude,
        longitude,
        traffic_source,
        created_at
    FROM
        {{ source('raw', 'users')}}
)

SELECT 
    *
FROM
    users
    