# The name of this view in Looker is "Sensor Data"
view: sensor_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_geo_map_poc.sensor_data` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Lat Long" in Explore.

  dimension: lat_long {
    type: location
    map_layer_name: countries
    sql: ${TABLE}.Lat_Long ;;
    drill_fields: [sensor_details*]
    hidden: yes
  }
  set: sensor_details {
    fields: [sensor_id,
      sensor_name,
      type_measure,
      sensor_type]
  }

  dimension: video {

    type: string

    sql: 'https://cdn.britannica.com/80/149180-050-23E41CF0/topographic-map.jpg' ;;

    html:<p><img alt="Hover" onmouseout="this.src='https://media.tenor.com/lJ3nu6akejIAAAAM/smoke-alarms-market.gif';" onmouseover="this.src='https://media.tenor.com/lJ3nu6akejIAAAAM/smoke-alarms-market.gif';" src="https://media.tenor.com/lJ3nu6akejIAAAAM/smoke-alarms-market.gif" /></p>
  ;;

  }



  dimension: location_name {
    type: number
    sql: ${TABLE}.Location_Name ;;

  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_location_name {
    type: sum
    sql: ${location_name} ;;  }
  measure: average_location_name {
    type: average
    sql: ${location_name} ;;  }

  dimension: location_picture {
    type: string
    sql: ${TABLE}.location_picture ;;
  }

  dimension: location_picture_hyperlink {
    type: string
    sql: ${TABLE}.Location_Picture_Hyperlink ;;
  }

  dimension: sensor_id {
    type: string
    sql: ${TABLE}.Sensor_ID ;;
  }

  dimension: sensor_location {
    type: string

    sql: ${TABLE}.Sensor_Location ;;
  }

  dimension: sensor_name {
    type: string
    sql: ${TABLE}.Sensor_Name ;;
  }

  dimension: sensor_type {
    type: string
    sql: ${TABLE}.Sensor_Type ;;
  }
  dimension: product_image {
    sql: ${sensor_id} ;;
    html: <img src="https://www.altostrat.com/product_images/{{ value }}.jpg" /> ;;
  }

  dimension: type_measure {
    type: string
    sql: ${TABLE}.Type_Measure ;;
  }
  measure: count {
    type: count
    drill_fields: [sensor_details*]
  }

}
