include: "/views_raw/distribution_centers.view.lkml"
view: +distribution_centers {

dimension: id {
  primary_key: yes

}

dimension: latitude {
  type: number
}


measure: total_latitude {
  type: sum
  sql: ${latitude} ;;
}

measure: average_latitude {
  type: average
  sql: ${latitude} ;;
}

dimension: longitude {

}

dimension: name {

}

measure: count {
  type: count
  label: "Count of Distribution Centers"
  drill_fields: [id, name, products.count]
}
}
