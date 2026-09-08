with source as (select * from {{ source("raw_sap", "t001") }} where mandt = 100)
select
    bukrs as company_code,
    butxt as company_name,
    ort01 as city,
    land1 as country_key,
    waers as local_currency,
    spras as language_key,
    ktopl as chart_of_accounts,
    periv as fiscal_year_variant,
    stceg as vat_registration_no,
    adrnr as address_number
from source
