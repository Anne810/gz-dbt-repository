WITH sales AS (
    SELECT
    orders_id
    ,date_date
    ,revenue
    ,quantity
   ,ROUND((purchase_price * quantity),2) AS purchase_cost
FROM {{ ref('stg_raw_sales') }} 
LEFT JOIN {{ ref('stg_raw_products') }}
USING (products_id))

SELECT
    orders_id
    , date_date
    ,revenue
    ,quantity
    , purchase_cost  
    ,ROUND ((revenue - purchase_cost),2) AS margin
FROM sales