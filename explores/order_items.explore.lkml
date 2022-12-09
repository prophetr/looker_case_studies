include: "/views_refined/refined_order_items.view.lkml"
include: "/views_refined/refined_users.view.lkml"
include: "/views_raw/inventory_items.view.lkml"
include: "/views_raw/products.view.lkml"
include: "/views_refined/refined_distribution_centers.view.lkml"
explore: order_items {
  join: users {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${order_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}
