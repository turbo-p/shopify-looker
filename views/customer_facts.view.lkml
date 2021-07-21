view: customer_facts {
  derived_table: {
    sql: select customer_id,
      customer_email,
       case
               when COUNT(*) = 1 then 'new'
               when COUNT(*) = 0 then 'new'
               else 'repeat' end as customer_type,
      min((DATE(convert_timezone('UTC', 'America/New_York', orders.timestamp )))) as first_order_date,
      max((DATE(orders.timestamp ))) as most_recent_purchase,
      COUNT(*) as lifetime_orders,
      sum(revenue) as lifetime_revenue

      from  ${orders.SQL_TABLE_NAME} orders
      where cancelled_at is null
      group by 1,2
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: customer_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_email {
    type: string
    sql: ${TABLE}.customer_email ;;
  }

  dimension: customer_type {
    type: string
    sql: ${TABLE}.customer_type ;;
  }

  dimension_group: first_order_date {
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
    sql: ${TABLE}.first_order_date ;;
    convert_tz: no
  }

  dimension: most_recent_purchase {
    type: date
    sql: ${TABLE}.most_recent_purchase ;;
  }

  dimension: lifetime_orders {
    type: number
    sql: ${TABLE}.lifetime_orders ;;
  }

  dimension: lifetime_revenue {
    type: number
    sql: ${TABLE}.lifetime_revenue ;;
  }


  measure: sum_lifetime_revenue {
    type: sum
    sql: ${lifetime_revenue} ;;
    drill_fields: [detail*]
  }

  measure: avg_order_value {
    type: average
    sql: ${lifetime_revenue} ;;
    drill_fields: [detail*]
  }

  measure: avg_order_count {
    type: average
    sql: ${lifetime_orders} ;;
    drill_fields: [detail*]
  }




  set: detail {
    fields: [
      customer_id,
      customer_email,
      customer_type,
     # first_order_date,
      most_recent_purchase,
      lifetime_orders,
      lifetime_revenue
    ]
  }
}
