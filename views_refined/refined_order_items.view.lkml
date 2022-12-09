include: "/views_raw/order_items.view.lkml"

view: +order_items {
dimension: id {
  primary_key: yes
  type: number
  sql: ${TABLE}.id ;;
}

# Dates and timestamps can be represented in Looker using a dimension group of type: time.
# Looker converts dates and timestamps to the specified timeframes within the dimension group.

dimension_group: created {
  type: time
  timeframes: [
    raw,
    time,
    date,
    week,
    month,
    quarter,
    year
  ]
  sql: ${TABLE}.created_at ;;
}

dimension_group: delivered {
  type: time
  timeframes: [
    raw,
    time,
    date,
    week,
    month,
    quarter,
    year
  ]
  sql: ${TABLE}.delivered_at ;;
}

# Here's what a typical dimension looks like in LookML.
# A dimension is a groupable field that can be used to filter query results.
# This dimension will be called "Inventory Item ID" in Explore.

dimension: inventory_item_id {

}

dimension: order_id {

}

dimension: product_id {

}

dimension_group: returned {
  type: time
  timeframes: [
    raw,
    time,
    date,
    week,
    month,
    quarter,
    year
  ]
  sql: ${TABLE}.returned_at ;;
}

dimension: sale_price {

}

dimension_group: shipping_days {
  type: duration
  sql_start: ${shipped_date} ;;
  sql_end: ${delivered_date} ;;
  intervals: [day, week]

}

# A measure is a field that uses a SQL aggregate function. Here are defined sum and average
# measures for this dimension, but you can also add measures of many different aggregates.
# Click on the type parameter to see all the options in the Quick Help panel on the right.

measure: total_sale_price {
  type: sum
  sql: ${sale_price} ;;
  value_format_name: usd
}

measure: average_sale_price {
  type: average
  sql: ${sale_price};;
  value_format_name: usd
}

measure: unique_orders {
  type: count_distinct
  sql: ${order_id} ;;
}

measure: total_sales_email_traffic {
  type: sum
  sql: ${sale_price} ;;
  filters: [users.is_email_sourced: "Yes"]
}

measure: percentage_sales_email_source {
  type: number
  sql: 1.0*${total_sales_email_traffic}/NULLIF(${total_sale_price}, 0) ;;
  value_format_name: percent_2
}

dimension_group: shipped {
  type: time
  timeframes: [
    raw,
    time,
    date,
    week,
    month,
    quarter,
    year
  ]
  sql: ${TABLE}.shipped_at ;;
}

dimension: user_id {

}

measure: count {
  type: count
  label: "Count of Order Items"
  drill_fields: [detail*]
}

# ----- Sets of fields for drilling ------
set: detail {
  fields: [
    id,
    users.last_name,
    users.id,
    users.first_name,
    inventory_items.id,
    inventory_items.product_name,
    products.name,
    products.id
  ]
}
}
