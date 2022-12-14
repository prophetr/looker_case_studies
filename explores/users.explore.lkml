include: "/views_refined/refined_users.view.lkml"
include: "/views_refined/refined_order_items.view.lkml"

explore: users {
  always_filter: {
    filters: [order_items.created_date: "before today"]
  }
  conditionally_filter: {
    filters: [users.created_date: "last 90 days"]
    unless: [users.id, users.state]
  }
  join: order_items {
    type: left_outer
    sql_on: ${users.id} = ${order_items.user_id} ;;
    relationship: one_to_many
  }
}
