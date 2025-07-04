
WITH events AS(
    SELECT 
        event_id,
        user_id,
        sequence_num,
        session_id,
        created_at,
        ip_address,
        city,
        state,
        browser,
        traffic_source,
        uri,
        event_type
    FROM
        {{ ref('stg_events')}}
)

SELECT 
    *
FROM
    events