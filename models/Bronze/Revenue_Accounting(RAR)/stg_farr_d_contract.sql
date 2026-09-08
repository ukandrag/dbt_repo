with source as (select * from {{ source("raw_sap", "farr_d_contract") }})
select
    mandt,
    contract_id,
    contract_type,
    customer_id,
    start_date,
    end_date,
    currency,
    bukrs,
    vkorg,
    vtweg,
    spart,
    contract_status,
    erdat,
    ernam,
    aedat
from source
