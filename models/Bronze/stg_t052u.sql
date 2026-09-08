with source as (select * from {{ source("raw_sap", "t052u") }} where mandt = 100)
select spras as language_key, zterm as payment_terms_key, text1 as payment_terms_text
from source
