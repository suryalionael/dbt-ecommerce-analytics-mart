{{ config(materialized='table') }}

WITH date_range AS (
    SELECT
        order_purchase_timestamp::date AS order_date
    FROM {{ ref('staging_olist_orders') }}
    UNION ALL
    SELECT
        order_approved_at::date AS order_date
    FROM {{ ref('staging_olist_orders') }}
    UNION ALL
    SELECT
        order_delivered_carrier_date::date AS order_date
    FROM {{ ref('staging_olist_orders') }}
    UNION ALL
    SELECT
        order_estimated_delivery_date::date AS order_date
    FROM {{ ref('staging_olist_orders') }}
    UNION ALL
    SELECT
        order_delivered_customer_date::date AS order_date
    FROM {{ ref('staging_olist_orders') })
SELECT DISTINCT
    order_date,
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    EXTRACT(DAY FROM order_date) AS day,
    TO_CHAR(order_date, 'Day') AS day_name,
    TO_CHAR(order_date, 'Month') AS month_name
FROM date_range
