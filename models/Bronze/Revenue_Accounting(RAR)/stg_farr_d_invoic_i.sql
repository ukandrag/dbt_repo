with source as (select * from {{ source("raw_sap", "farr_d_invoic_i") }})
select
    mandt,
    billing_id,
    billing_item,
    pob_id,
    order_id,
    order_item,
    invoice_amount,
    currency,
    matnr,
    kunnr,
    bukrs,
    erdat,
    ernam
from source
