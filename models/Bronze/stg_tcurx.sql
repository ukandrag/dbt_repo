with source as (select * from {{ source("raw_sap", "tcurx") }})
select currkey, currdec
from source
