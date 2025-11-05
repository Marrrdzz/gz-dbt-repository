WITH joinning AS(
SELECT 
* 
FROM {{ ref('int_campaigns_days') }} AS campaign
LEFT JOIN {{ ref('finance_days') }} AS finance 
USING (date_date))
 
 SELECT 
 date_date
 ,ROUND((operational_margin - ads_cost),2) as ads_margin
 ,avgbasket
 ,operational_margin
 ,ads_cost
 ,impression as ads_impression
 ,click as ads_click
 ,total_product
 ,total_revenue
 ,total_purchase_cost
 ,total_shipping_fee
 ,total_logcost
 ,margin
 ,ship_cost as total_ship_cost
 FROM joinning



