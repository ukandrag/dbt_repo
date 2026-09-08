with source as (select * from {{ source("raw_sap", "marc") }} where mandt = 100)
select
    matnr as material_number,
    werks as plant,
    dismm as mrp_type,
    dispo as mrp_controller,
    beskz as procurement_type,
    ekgrp as purchasing_group,
    plifz as planned_delivery_days,
    webaz as goods_receipt_processing_days,
    perkz as period_indicator,
    losgr as lot_size,
    bklas as valuation_class,
    mtvfp as availability_check_group,
    lvorm as deletion_flag
from source
