SELECT 
date_date
,orders_id
,quantity
,revenue
,purchase_cost
,shipping_fee
,logcost
,ship_cost
,margin
,ROUND((margin+shipping_fee-logcost-ship_cost),2) as operational_margin
FROM {{ ref('int_orders_margin') }} AS orders_margin
LEFT JOIN {{ ref('stg_raw__ship') }} AS ship
USING(orders_id)
