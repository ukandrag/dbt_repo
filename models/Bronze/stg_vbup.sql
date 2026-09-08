with source as (select * from {{source('raw_sap','vbup')}} where mandt = 100)
select 
    VBELN AS sales_document,
    POSNR AS item_number,
    LFSTA AS delivery_status,
    WBSTA AS goods_movement_status,
    FKSTA AS billing_status,
    GBSTA AS overall_processing_status,
    COSTA AS confirmation_status,
    ABSTA AS rejection_status,
    KOSTA AS picking_status,
    LSSTA AS warehouse_status
from 
    source