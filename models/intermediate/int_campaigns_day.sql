{#############
this 
    is just a
        comment
##############}
{#config block for materialization
{{
    config(
        materialized='table'
    )
}}
#}

with
    campaigns as (
        select
            date_date,

            ads_cost,
            impression,
            click
        from {{ ref("int_campaigns") }}
    ),
    campaigns_agg as (
        select 
            date_date,

            sum(ads_cost) as ads_cost,
            sum(impression) as ads_impression,
            sum(click) as ads_clicks
        from campaigns
        group by 1
        order by 1 desc
    )
select * from campaigns_agg