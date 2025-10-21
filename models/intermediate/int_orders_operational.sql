WITH operational AS (
    SELECT 
    *
FROM {{ ref('int_orders_margin') }}
LEFT JOIN {{ ref('stg_raw_ship') }}
USING (orders_id))

SELECT
    orders_id,
    date_date,
    ROUND ((margin + shipping_fee - logCost - ship_cost),2) AS operational_margin,
    quantity,
    revenue,
    purchase_cost,
    margin,
    shipping_fee,
    logCost,
    ship_cost
FROM operational


