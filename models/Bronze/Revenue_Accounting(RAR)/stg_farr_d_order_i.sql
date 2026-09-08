with source as (select * from {{ source("raw_sap", "farr_d_order_i") }})
select
    mandt,
    order_id,
    order_item,
    contract_id,
    pob_id,
    quantity,
    currency,
    transaction_amount,
    matnr,
    kunnr,
    erdat,
    ernam

from source
