with source as (select * from {{ source('raw_sap', 'bkpf') }} where mandt = 100)
select
    bukrs as company_code,
    belnr as accounting_document,
    gjahr as fiscal_year,
    blart as document_type,
    bldat as document_date,
    budat as posting_date,
    monat as fiscal_period,
    cpudt as entry_date,
    usnam as entered_by,
    tcode as transaction_code, 
    bktxt as header_text,
    xblnr as reference_document,
    waers as document_currency,
    kursf as exchange_rate,
    bstat as document_status,
    stblg as reversal_document,
    stjah as reversal_fiscal_year,
    aedat as last_changed_date
from source
