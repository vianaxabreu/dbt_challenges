with
    sales_margin as (select * from {{ ref("int_sales_margin") }}),

    orders_grouped as (
        select
            orders_id,
            date_date,
            round(sum(revenue), 2) as revenue,
            round(sum(quantity), 2) as quantity,
            round(sum(purchase_cost), 2) as purchase_cost,
            round(sum(margin), 2) as margin,
        from sales_margin

        group by 1, 2
        order by 1 desc
    )
select *
from
    orders_grouped