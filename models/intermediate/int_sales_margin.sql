with
    orders as (select * from {{ ref("stg_raw__sales") }}),

    products as (select * from {{ ref("stg_raw__product") }}),
    
    orders_joined_products as (
        select
            orders.date_date,
            orders.orders_id,
            orders.products_id,
            orders.quantity,
            orders.revenue,
            products.purchase_price,
            round(orders.quantity * products.purchase_price, 2) as purchase_cost,
        from orders

        left join products using (products_id)
    ),

    sales_margin as (
        select
            *,
            round((revenue - purchase_cost), 2) as margin,
            {{ margin_percent('revenue', 'purchase_cost') }} as margin_percent


        from orders_joined_products
    )
select *
from
    sales_margin