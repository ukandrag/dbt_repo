with source as (select * from {{ source("raw_sap", "knb1") }} where mandt = 100)
select
    kunnr as customer_number,
    bukrs as company_code,
    erdat as created_date,
    ernam as created_by,
    sperr as posting_block,
    loevm as deletion_flag,
    busab as accounting_clerk,
    akont as reconciliation_account,
    fdgrv as cash_mgmt_group,
    zuession as payment_method_supplement,
    perkz as payment_history_record
from source
