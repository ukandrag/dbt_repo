with source as (select * from {{ source("raw_sap", "farr_d_pob") }})
select
    mandt,
    pob_id,
    contract_id,
    pob_status,
    pob_type,
    operational_source_type,
    operational_source_id,
    ts_amount,
    al_amount,
    currency,
    matnr,
    werks,
    erdat,
    ernam
from source
