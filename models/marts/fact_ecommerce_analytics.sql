WITH ecommerce_analytics AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key([
            'o.order_id',
            'u.user_id',
            'ot.order_item_id',
            'p.prod_id',
            'i.inventory_id',
            'd.dist_id',
            'e.event_id'
        ]) }} AS analytic_id,
        o.order_id,
        u.user_id,
        ot.order_item_id,
        p.prod_id,
        i.inventory_id,
        d.dist_id,
        e.event_id
    FROM
        {{ ref('dim_events') }} e
        JOIN {{ ref('dim_users') }} u ON e.user_id = u.user_id
        JOIN {{ ref('dim_orders') }} o ON o.user_id = u.user_id
        JOIN {{ ref('dim_order_items') }} ot ON ot.order_id = o.order_id
        JOIN {{ ref('dim_inventory') }} i ON ot.inventory_id = i.inventory_id
        JOIN {{ ref('dim_products') }} p ON p.prod_id = i.prod_id
        JOIN {{ ref('dim_distributions') }} d ON d.dist_id = p.prod_dist_id
)

SELECT 
    *
FROM
    ecommerce_analytics
