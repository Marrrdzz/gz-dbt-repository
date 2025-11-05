SELECT 
date_date
,orders_id
,ROUND(SUM(revenue),2) as revenue
,SUM(quantity) as quantity
,ROUND(SUM(purchase_cost),2) as purchase_cost
,ROUND(SUM(margin),2) as margin
FROM {{ ref('int_sales_margin') }}
GROUP BY date_date, orders_id
ORDER BY orders_id DESC