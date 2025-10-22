WITH campaign_day AS (
    SELECT 
*
FROM {{ ref('int_campaigns') }} AS c
JOIN {{ ref('finance_days') }} AS f
USING (date_date))

SELECT
    date_date,
   ROUND (SUM ((tot_operational_margin - ads_cost)),2) AS ads_margin,
   ROUND (SUM (avg_basket),2) AS avg_basket,
   ROUND (SUM (tot_operational_margin),2) AS tot_operational_margin,
   ROUND( SUM (ads_cost),2) AS ads_cost,
   ROUND( SUM (impression),2) AS ads_impression,
   ROUND( SUM (click),2) AS ads_click,
   ROUND (SUM (tot_qty),2) AS tot_qty,
   ROUND (SUM (tot_purchase_cost),2) AS tot_purchase_cost,
   ROUND (SUM (margin),2) AS tot_margin,
   ROUND( SUM (tot_shipping_fee),2) AS tot_shipping_fee,
   ROUND (SUM (tot_log_cost),2) AS tot_log_cost,
   ROUND ( SUM (tot_ship_cost),2) AS tot_ship_cost,
FROM campaign_day
GROUP BY date_date