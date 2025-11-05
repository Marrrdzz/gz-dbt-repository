WITH finance as (
SELECT 
sales.date_date
,sales.orders_id
,sales.revenue
,sales.quantity
,p.purchase_price
,p.products_id
FROM {{ ref('stg_raw__sales') }} AS sales
LEFT JOIN {{ ref('stg_raw__product') }} AS p
USING (products_id)
)

, marge as (
SELECT 
*
,ROUND((purchase_price*quantity),2) as purchase_cost
,ROUND((revenue - ROUND((purchase_price*quantity),2)),2) as margin
FROM finance)

SELECT * 
,{{margin_percent('margin','revenue')}} as margin_percent
FROM marge
