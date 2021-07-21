connection: "redshift"

# include all the views
include: "/views/**/*.view"
include: "/dashboards/*.dashboard.lookml"

datagroup: shopify_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: shopify_default_datagroup

explore: orders {

  join: customer_facts {
    sql_on: ${customer_facts.customer_id} = ${orders.customer_id} ;;
    relationship: many_to_one
  }
}

explore: customers {}

explore: customer_facts {}
