{%- set source_model = "hub_orders" -%}        <-- the hub or link
{%- set src_pk = "ORDER_PK" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set as_of_dates_table = "as_of_dates" -%}  <-- a table of dates/timestamps
{%- set satellites = {
     "sat_order_details": { "pk": {"PK": "ORDER_PK"}, "ldts": {"LDTS": "DETAILS_LOAD_DATE"} },
     "sat_order_status": { "pk": {"PK": "ORDER_PK"}, "ldts": {"LDTS": "STATUS_LOAD_DATE"} },
     -- etc
   } -%}
{%- set stage_tables_ldts = {
     "v_stg_order_details": "DETAILS_LOAD_DATE",
     "v_stg_order_status": "STATUS_LOAD_DATE"
   } -%}

{{ automate_dv.pit(source_model=source_model, src_pk=src_pk,
                     as_of_dates_table=as_of_dates_table,
                     satellites=satellites,
                     stage_tables_ldts=stage_tables_ldts,
                     src_ldts=src_ldts) }}
