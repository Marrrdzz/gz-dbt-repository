SELECT 
EXTRACT(MONTH FROM date_date) as date_month
 ,ROUND(SUM(ads_margin),2) as ads_margin 
 ,ROUND(SUM(avgbasket),2) as avgbasket
 ,ROUND(SUM(operational_margin),2) as operational_margin
 ,ROUND(SUM(ads_cost),2) as ads_cost
 ,ROUND(SUM(ads_impression),2) as ads_impression
 ,ROUND(SUM(ads_click),2) as ads_click
 ,ROUND(SUM(total_product),2) as total_product
 ,ROUND(SUM(total_revenue),2) as total_revenue
 ,ROUND(SUM(total_purchase_cost),2) as total_purchase_cost
 ,ROUND(SUM(total_shipping_fee),2) as total_shipping_fee
 ,ROUND(SUM(total_logcost),2) as total_logcost
 ,ROUND(SUM(margin),2) as total_margin
 ,ROUND(SUM(total_ship_cost),2) as total_ship_cost
 FROM {{ ref('finance_campaigns_day') }}
 GROUP BY date_month
 ORDER BY EXTRACT(MONTH FROM date_date) ASC 