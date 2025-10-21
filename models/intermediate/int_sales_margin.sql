WITH sales AS (
    SELECT
    S.orders_id
    ,S.date_date
    ,S.revenue
    ,S.quantity
   ,ROUND((p.purchase_price * S.quantity),2) AS purchase_cost
FROM {{ ref('stg_raw_sales') }} AS S
LEFT JOIN {{ ref('stg_raw_products') }} AS P
ON p.products_id = S.products_id)

SELECT
    orders_id
    , date_date
    ,revenue
    ,quantity
    , purchase_cost  
    ,ROUND ((revenue - purchase_cost),2) AS margin
FROM sales