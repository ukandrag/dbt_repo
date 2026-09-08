with source as (select * from {{source('raw_sap','vbuk')}} where mandt = 100)
select 
    VBELN AS sales_document,
    GBSTK AS overall_status,
    LFSTK AS delivery_status,
    WBSTK AS goods_movement_status,
    FKSTK AS billing_status,
    COSTK AS confirmation_status,
    CMGST AS credit_status,
    ABSTK AS rejection_status,
    BUCHK AS posting_status,
    AEDAT AS last_changed_date
from 
    source