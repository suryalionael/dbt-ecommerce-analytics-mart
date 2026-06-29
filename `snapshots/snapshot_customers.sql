{{ config(materialized='snapshot', unique_key='customer_id') }}

SELECT
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state,
    customer_country,
    customer_age,
    customer_marital_status,
    customer_income_level
FROM {{ ref('stg_customers') }}
