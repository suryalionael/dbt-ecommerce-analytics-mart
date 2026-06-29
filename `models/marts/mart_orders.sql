{{ config(materialized='table') }}

WITH fct_orders AS (
    SELECT * FROM {{ ref('int_fct_orders') }},
    dim_customers AS (
        SELECT * FROM {{ ref('int_dim_customers') }}
    ),
    dim_products AS (
        SELECT * FROM {{ ref('int_dim_products') }}
    ),
    dim_dates AS (
        SELECT * FROM {{ ref('int_dim_dates') }}
    ),
    dim_sellers AS (
        SELECT * FROM {{ ref('int_dim_sellers') }}
    )
SELECT
    f.order_id,
    d.customer_id,
    d.customer_unique_id,
    d.customer_zip_code_prefix,
    d.customer_city,
    d.customer_state,
    d.customer_country,
    d.customer_age,
    d.customer_marital_status,
    d.customer_income_level,
    f.product_id,
    p.product_category_name,
    p.product_name_length,
    p.product_description_length,
    p.product_photos_qty,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm,
    f.seller_id,
    s.seller_zip_code_prefix,
    s.seller_city,
    s.seller_state,
    s.seller_country,
    f.order_status,
    f.order_purchase_timestamp,
    f.order_approved_at,
    f.order_delivered_carrier_date,
    f.order_estimated_delivery_date,
    f.order_delivered_customer_date,
    d_order.year AS order_year,
    d_order.month AS order_month,
    d_order.day AS order_day,
    d_order.day_name AS order_day_name,
    d_order.month_name AS order_month_name
FROM fct_orders f
JOIN dim_customers d ON f.customer_id = d.customer_id
JOIN dim_products p ON f.product_id = p.product_id
JOIN dim_sellers s ON f.seller_id = s.seller_id
JOIN dim_dates d_order ON f.order_purchase_timestamp::date = d_order.order_date
