with
    finance_campaign_day as ( select * from {{ ref("mart_finance_campaigns_day") }}),
    finance_campaign_month as (
        select
            date_trunc(date_date, month) as datemonth,

            sum(operational_margin - ads_cost) as ads_margin,
            round(sum(average_basket),2) as average_basket,
            sum(operational_margin) as operational_margin,
            sum(ads_cost) as ads_cost,
            sum(ads_impression) as ads_impression,
            sum(ads_clicks) as ads_clicks,
            sum(quantity) as quantity,
            sum(revenue) as revenue,
            sum(purchase_cost) as purchase_cost,
            sum(margin) as margin,
            sum(shipping_fee) as shipping_fee,
            sum(logcost) as logcost,
            sum(ship_cost) as ship_cost
        from finance_campaign_day
        group by 1
        order by datemonth desc
    )
select * from finance_campaign_month