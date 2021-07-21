view: orders {
  sql_table_name: public.fact_shopify_orders ;;


  dimension: amount_refunded {
    type: number
    sql: ${TABLE}.amount_refunded ;;
  }

  dimension: app_id {
    type: number
    sql: ${TABLE}.app_id ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: cancel_reason {
    type: string
    sql: ${TABLE}.cancel_reason ;;
  }

  dimension_group: cancelled {
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
    sql: ${TABLE}.cancelled_at ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension_group: closed {
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
    sql: ${TABLE}.closed_at ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: current_campaign {
    type: string
    sql: ${TABLE}.current_campaign ;;
  }

  dimension: current_channel {
    type: string
    sql: ${TABLE}.current_channel ;;
  }

  dimension: current_device {
    type: string
    sql: ${TABLE}.current_device ;;
  }

  dimension: current_metro {
    type: string
    sql: ${TABLE}.current_metro ;;
  }

  dimension: current_source {
    type: string
    sql: ${TABLE}.current_source ;;
  }

  dimension: customer_email {
    type: string
    sql: ${TABLE}.customer_email ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: day_of_week {
    type: string
    sql: ${TABLE}.day_of_week ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: discount {
    type: number
    sql: ${TABLE}.discount ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: fulfillment_status {
    type: string
    sql: ${TABLE}.fulfillment_status ;;
  }

  dimension: gateway {
    type: string
    sql: ${TABLE}.gateway ;;
  }

  dimension: gift_card_revenue {
    type: number
    sql: ${TABLE}.gift_card_revenue ;;
  }

  dimension: glew_account_id {
    type: number
    sql: ${TABLE}.glew_account_id ;;
  }

  dimension: highest_priced_product {
    type: number
    sql: ${TABLE}.highest_priced_product ;;
  }

  dimension: is_gift_card {
    type: yesno
    sql: ${TABLE}.is_gift_card ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: line_item_count {
    type: number
    sql: ${TABLE}.line_item_count ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: lowest_priced_product {
    type: number
    sql: ${TABLE}.lowest_priced_product ;;
  }

  dimension: metro {
    type: string
    sql: ${TABLE}.metro ;;
  }

  dimension: order_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: order_source {
    type: string
    sql: ${TABLE}.order_source ;;
  }

  dimension: pos {
    type: string
    sql: ${TABLE}.pos ;;
  }

  dimension: pos_id {
    type: number
    sql: ${TABLE}.pos_id ;;
  }

  dimension: processiong_method {
    type: string
    sql: ${TABLE}.processiong_method ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

  dimension: sales_channel {
    type: string
    sql: ${TABLE}.sales_channel ;;
  }

  dimension: sales_channel_id {
    type: number
    sql: ${TABLE}.sales_channel_id ;;
  }

  dimension: shipping {
    type: number
    sql: ${TABLE}.shipping ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: source_identifier {
    type: string
    sql: ${TABLE}.source_identifier ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: tax {
    type: number
    sql: ${TABLE}.tax ;;
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

  dimension: transaction_id {
    type: string
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: user {
    type: string
    sql: ${TABLE}."user" ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [first_name, last_name]
  }

  measure: total_revenue {
    type: sum
    sql: ${revenue} ;;
    #drill_fields: [detail*]
    value_format_name: usd
  }

  measure: sum_lifetime_revenue {
    type: sum
    sql: ${customer_facts.lifetime_revenue} ;;
    drill_fields: [customer_facts.detail*]
  }

  measure: avg_order_value {
    type: average
    sql: ${customer_facts.lifetime_revenue} ;;
    drill_fields: [customer_facts.detail*]
  }

  measure: avg_order_count {
    type: average
    sql: ${customer_facts.lifetime_revenue} ;;
    drill_fields: [customer_facts.detail*]
  }


}
