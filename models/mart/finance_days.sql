{{ config(materialized='table') }}

select

    date_date,

    count(distinct orders_id) as total_transactions,

    sum(revenue) as total_revenue,

    sum(quantity) as total_quantity,

    sum(purchase_cost) as total_purchase_cost,

    sum(shipping_fee) as total_shipping_fee,

    sum(logcost) as total_log_cost,

    sum(ship_cost) as total_ship_cost,

    sum(margin) as total_margin,

    sum(operational_margin) as total_operational_margin,

    safe_divide(
        sum(revenue),
        count(distinct orders_id)
    ) as avg_basket

from {{ ref('int_orders_operational') }}

group by date_date
