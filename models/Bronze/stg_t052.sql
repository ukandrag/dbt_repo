with source as (select * from {{ source("raw_sap", "t052") }} where mandt = 100)
select
    zterm as payment_terms_key,
    zprz1 as discount_percent_1,
    ztag1 as discount_days_1,
    zprz2 as discount_percent_2,
    ztag2 as discount_days_2,
    ztag3 as net_payment_days
from source
