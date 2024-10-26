{#
    attention!!
    to use variables inside a function you have to use the curl brackets to encapsulate the variable
#}

{#
    function puschase_level
    get the level as integer and return low or high according to being great than 9 or not
#}
{% macro purchase_level(col) %}
    (case when {{ col }} < 10 then "low" when {{ col }} > 9 then "high" end)
{% endmacro %}


{# margin_percent function is used on the model int_sales_margin.sql #}
{% macro margin_percent(revenue, purchase_cost, precision=2) %}
    round(
        safe_divide(({{ revenue }} - {{ purchase_cost }}), {{ revenue }}),
        {{ precision }}
    )
{% endmacro %}
