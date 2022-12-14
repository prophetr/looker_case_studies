include: "/views_raw/events.view.lkml"
view: +events {

  dimension: id {
    primary_key: yes

  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Browser" in Explore.

  dimension: browser {

  }

  dimension: city {

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

  dimension: event_type {

  }

  dimension: ip_address {

  }

  dimension: postal_code {

  }

  dimension: sequence_number {

  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_sequence_number {
    type: sum
    sql: ${sequence_number} ;;
  }

  measure: average_sequence_number {
    type: average
    sql: ${sequence_number} ;;
  }

  dimension: session_id {

  }

  dimension: state {

  }

  dimension: traffic_source {

  }

  dimension: uri {

  }

  dimension: user_id {

  }

  measure: count {
    type: count
    label: "Count of Events"
    drill_fields: [id, users.last_name, users.id, users.first_name]
  }
}
