{{ config(
materialized='table',
partition_by={
"field": "date_purchase",
"data_type": "date"
}
) }}
SELECT
    p.parcel_id,
    p.qty,
    p.model_name,
    c.parcel_tracking,
    c.transporter,
    c.priority,
    c.status,
    c.date_purchase,
    c.date_shipping,
    c.date_delivery,
    c.date_cancelled,
    c.expedition_time,
    c.transport_time,
    c.delivery_time,
    c.delay
FROM {{ ref('stg_raw_parcel_product') }} as p
LEFT JOIN {{ ref('cc_parcel') }} as c USING (parcel_id)