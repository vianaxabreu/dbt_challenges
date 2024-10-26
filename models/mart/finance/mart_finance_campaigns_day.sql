with
    campaigns_day as ( select * from {{ ref('int_campaigns_day') }} ),
    finance_days as ( select * from {{ ref('mart_finance_days') }}  ),
    campaigns_finance_joined as (
        select
            date_date,

            operational_margin - ads_cost as ads_margin,
            round(average_basket,2) as average_basket,
            operational_margin,
            ads_cost,
            ads_impression,
            ads_clicks,
            quantity,
            revenue,
            purchase_cost,
            margin,
            shipping_fee,
            logcost,
            ship_cost
        from campaigns_day
        full outer join finance_days
        using (date_date)
        order by 1 desc
    )
select * from campaigns_finance_joined