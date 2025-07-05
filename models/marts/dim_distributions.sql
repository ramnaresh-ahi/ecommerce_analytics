
WITH distributions AS(
    SELECT
        *
    FROM
        {{ ref('int_distributions')}}
)

SELECT
    *
FROM
    distributions