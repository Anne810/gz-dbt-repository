SELECT
    date_date,
   ROUND (COUNT (orders_id),2) AS nb_transaction,
   ROUND (SUM (revenue),2) AS tot_revenue,
    ROUND (AVG (revenue),2) AS avg_basket,
    ROUND (SUM (operational_margin),2) AS tot_operational_margin,
    ROUND (SUM (purchase_cost),2) AS tot_purchase_cost,
    ROUND (SUM (shipping_fee),2) AS tot_shipping_fee,
   ROUND(SUM (logCost),2) AS tot_log_cost,
    ROUND(SUM (quantity),2) AS tot_qty,
    ROUND( SUM (margin),2) AS margin,
    ROUND (SUM (ship_cost),2) AS tot_ship_cost,
FROM {{ ref('int_orders_operational') }}
GROUP BY date_date