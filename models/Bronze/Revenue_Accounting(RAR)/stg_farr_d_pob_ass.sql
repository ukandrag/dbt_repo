with source as (select * from {{ source("raw_sap", "farr_d_pob_ass") }})
select
    mandt,
    pob_id,
    vbtyp,
    vbeln,
    posnr,
    assignment_percent,
    assignment_amount,
    currency,
    erdat,
    ernam
from source
