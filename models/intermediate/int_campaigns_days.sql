SELECT 
date_date
,campaign_key
,paid_source
,campaign_name
,SUM(ads_cost) as ads_cost
,SUM(impression) as impression
,SUM(click) as click
FROM {{ ref('int_campaigns') }}
GROUP BY date_date, campaign_key,paid_source,campaign_name
ORDER BY date_date DESC