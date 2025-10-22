with
    operational as (
        select *
        from {{ ref("int_orders_margin") }}
        left join {{ ref("stg_raw_ship") }} using (orders_id)
    )

select
    orders_id,
    date_date,
    round((margin + shipping_fee - logcost - ship_cost), 2) as operational_margin,
    quantity,
    revenue,
    purchase_cost,
    margin,
    shipping_fee,
    logcost,
    ship_cost
from operational
