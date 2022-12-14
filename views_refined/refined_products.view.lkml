include: "/views_raw/products.view.lkml"
view: +products {

  dimension: id {
    primary_key: yes

  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Brand" in Explore.

  dimension: brand {

  }

  dimension: category {

  }

  dimension: cost {

  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cost {
    type: sum
    sql: ${cost} ;;
  }

  measure: average_cost {
    type: average
    sql: ${cost} ;;
  }

  dimension: department {

  }

  dimension: distribution_center_id {

  }

  dimension: name {

  }

  dimension: retail_price {

  }

  dimension: sku {

  }

  measure: count {
    type: count
    label: "Count of Products"
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      distribution_centers.name,
      distribution_centers.id,
      inventory_items.count,
      order_items.count
    ]
  }
}
