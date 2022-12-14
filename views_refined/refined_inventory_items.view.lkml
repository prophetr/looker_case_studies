include: "/views_raw/inventory_items.view.lkml"
  view: +inventory_items {

    dimension: id {
      primary_key: yes

    }

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cost" in Explore.

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

    dimension: product_brand {

    }

    dimension: product_category {

    }

    dimension: product_department {

    }

    dimension: product_distribution_center_id {

    }

    dimension: product_id {

    }

    dimension: product_name {

    }

    dimension: product_retail_price {

    }

    dimension: product_sku {

    }

    dimension_group: sold {
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
      sql: ${TABLE}.sold_at ;;
    }

    measure: count {
      type: count
      label: "Count of Inventory Items"
      drill_fields: [id, product_name, products.name, products.id, order_items.count]
    }
  }
