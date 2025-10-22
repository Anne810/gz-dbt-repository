select 
    extract(month from date_date) as date_month,
   ROUND (SUM ((tot_operational_margin - ads_cost)),2) AS ads_margin,
   ROUND (AVG (avg_basket),2) AS avg_basket,
   ROUND (SUM (tot_operational_margin),2) AS tot_operational_margin,
   ROUND( SUM (ads_cost),2) AS ads_cost,
   ROUND( SUM (ads_impression),2) AS ads_impression,
   ROUND( SUM (ads_click),2) AS ads_click,
   ROUND (SUM (tot_qty),2) AS tot_qty,
   ROUND (SUM (tot_purchase_cost),2) AS tot_purchase_cost,
   ROUND (SUM (tot_margin),2) AS tot_margin,
   ROUND( SUM (tot_shipping_fee),2) AS tot_shipping_fee,
   ROUND (SUM (tot_log_cost),2) AS tot_log_cost,
   ROUND ( SUM (tot_ship_cost),2) AS tot_ship_cost,
FROM {{ ref('mart_finance_campaign_day') }}
GROUP BY  date_month 