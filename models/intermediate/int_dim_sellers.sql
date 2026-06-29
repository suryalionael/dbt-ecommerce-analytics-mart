{{ config(materialized='table') }}

SELECT DISTINCT
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state,
    seller_country
FROM {{ ref('stg_sellers') }}
