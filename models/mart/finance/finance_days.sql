{{ config(materialized = 'table') }}
SELECT
date_date
,COUNT(orders_id) as total_nb_transaction
,ROUND(SUM(revenue),2) as total_revenue
,ROUND(SUM(operational_margin),2) as operational_margin
,ROUND(SUM(purchase_cost),2) as total_purchase_cost
,ROUND(SUM(shipping_fee),2) as total_shipping_fee
,ROUND(SUM(logcost),2) as total_logcost
,ROUND(SUM(quantity),2) as total_product
,ROUND(AVG(revenue),2) as avgbasket
,ROUND(SUM(margin),2) as margin
,ROUND(SUM(ship_cost),2) as ship_cost
FROM {{ ref('int_orders_operational') }}
GROUP BY date_date