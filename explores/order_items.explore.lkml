include: "/views_refined/refined_order_items.view.lkml"
include: "/views_refined/refined_users.view.lkml"
include: "/views_refined/refined_inventory_items.view.lkml"
include: "/views_refined/refined_products.view.lkml"
include: "/views_refined/refined_distribution_centers.view.lkml"

persist_with: order_items

explore: order_items {
  description: "Order Items that have not been returned and are >$200"
  always_filter: {
    filters: [order_items.created_date: "last 30 days"]
  }
  sql_always_where: ${returned_date} is null ;;
  sql_always_having: ${total_sale_price} > 200 ;;
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
