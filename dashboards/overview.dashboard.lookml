- dashboard: overview
  title: Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100

  filters:

  elements:
    - title: Total Orders This Month
      name: Total Orders This Month
      model: shopify
      explore: orders
      type: single_value
      fields: [orders.timestamp_month, orders.count]
      fill_fields: [orders.timestamp_month]
      filters:
        orders.timestamp_month: 12 months
        #location.name: ''
        #customer.new_vs_repeat: new
      sorts: [orders.timestamp_month desc]
      limit: 500
      column_limit: 50
      dynamic_fields: [{table_calculation: last_month, label: last_month, expression: 'offset(${orders.count},
  1)', value_format: !!null '', value_format_name: decimal_0}, {table_calculation: wow_change,
  label: wow_change, expression: "(${orders.count} - ${last_month}) / ${last_month}",
  value_format: !!null '', value_format_name: percent_0}]
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: true
      comparison_type: change
      comparison_reverse_colors: false
      show_comparison_label: true
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: true
      limit_displayed_rows: false
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#1C2260"
      series_types: {}
      hidden_fields: [last_month]
      comparison_label: month-over-month
      listen: {}
      row: 6
      col: 0
      width: 6
      height: 4
