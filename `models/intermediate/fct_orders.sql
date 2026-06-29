{{ config(materialized='table') }}

WITH order_items AS (
    SELECT
        order_id,
        product_id,
        seller_id,
        price,
        freight_value
    FROM {{ ref('staging_olist_order_items') }}
),
orders AS (
    SELECT
        order_id,
        customer_id,
        order_status,
        order_purchase_timestamp,
        order_approved_at,
        order_delivered_carrier_date,
        order_estimated_delivery_date,
        order_delivered_customer_date
    FROM {{ ref('staging_olist_orders') }}
)
SELECT
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_approved_at,
    o.order_delivered_carrier_date,
    o.order_estimated_delivery_date,
    o.order_delivered_customer_date,
    oi.product_id,
    oi.seller_id,
    oi.price,
    oi.freight_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
