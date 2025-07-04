WITH events AS(
    SELECT 
        id as event_id,
        user_id,
        sequence_number as sequence_num,
        session_id,
        created_at,
        ip_address,
        city,
        state,
        postal_code,
        browser,
        traffic_source,
        uri,
        event_type
    FROM
        {{ source('raw', 'events')}}
)

SELECT 
    *
FROM
    events