
WITH events AS(
    SELECT
        *
    FROM
        {{ ref('int_events')}}
)

SELECT
    *
FROM
    events