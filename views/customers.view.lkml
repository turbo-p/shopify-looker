view: customers {

  # # You can specify the table name if it's different from the view name:
   sql_table_name: public.fact_shopify_orders ;;
  #
   # Define your dimensions and measures here, like this:
   dimension: email {
     description: "Unique ID for each user that has ordered"
     type: string
     sql: ${TABLE}.customer_email ;;
   }

  dimension_group: timestamp {
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
    sql: ${TABLE}.timestamp ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: sales_channel {
    type: string
    sql: ${TABLE}.order_source ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  measure: cohort {
    type: date
    sql: Min(${timestamp_raw}) ;;
    convert_tz: yes
  }
  measure: first_order_month {
    type: date_month
    sql: ${cohort::date};;
    convert_tz: no
}

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

  measure: total_revenue {
    type: sum
    sql: ${revenue} ;;
    drill_fields: [detail*]
    value_format_name: usd
  }





# ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      sales_channel,
      total_revenue
    ]
  }





  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: customers {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
