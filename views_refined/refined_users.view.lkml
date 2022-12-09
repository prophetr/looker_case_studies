include: "/views_raw/users.view.lkml"
view: +users {

dimension: id {
  primary_key: yes

}

# Here's what a typical dimension looks like in LookML.
# A dimension is a groupable field that can be used to filter query results.
# This dimension will be called "Age" in Explore.

dimension: age {

}

dimension: age_tiers {
  type: tier
  tiers: [18, 25, 35, 45, 55, 65, 75, 90]
  sql: ${age} ;;
  style: integer

}


measure: total_age {
  type: sum
  sql: ${age} ;;
}

measure: average_age {
  type: average
  sql: ${age} ;;
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

}

dimension: email {

}

dimension: first_name {

}

dimension: gender {

}

dimension: last_name {

}

dimension: latitude {
  group_label: "User Address"
}

dimension: longitude {
  group_label: "User Address"
}

dimension: postal_code {
  group_label: "User Address"
}

dimension: state {
  group_label: "User Address"
}

dimension: city {
    group_label: "User Address"
}

dimension: country {
    group_label: "User Address"
}

dimension: street_address {
  group_label: "User Address"
}

dimension: traffic_source {

}

dimension: is_email_sourced {
  type: yesno
  sql: ${traffic_source} = 'Email' ;;
}

measure: count {
  type: count
  label: "Count of Users"
  drill_fields: [id, last_name, first_name, order_items.count, events.count]
}

dimension: city_state {
  type: string
  sql:${city} || ', ' || ${state} ;;
  group_label: "User Address"
}

}
