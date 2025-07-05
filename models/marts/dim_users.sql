
WITH users AS(
    SELECT 
        *
    FROM
        {{ ref('int_users')}}
)

SELECT 
    *
FROM
    users