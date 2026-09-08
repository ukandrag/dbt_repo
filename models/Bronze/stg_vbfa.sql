with source as (select * from {{ source("raw_sap", "vbfa") }} where mandt = 100)
select
    vbelv as preceding_document,
    posnv as preceding_item,
    vbeln as subsequent_document,
    posnn as subsequent_item,
    vbtyp_v as preceding_doc_category,
    vbtyp_n as subsequent_doc_category,
    rfmng as transferred_quantity,
    rfwrt as transferred_value,
    erdat as created_date,
    stufe as level,
    bwart as movement_type,
    fktyp as billing_type
from source
