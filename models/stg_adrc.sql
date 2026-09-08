with source as (select * from {{ source("raw_sap", "adrc") }} where mandt = 100)
select
    addrnumber as address_number,
    date_from as valid_from,
    name1 as name_1,
    name2 as name_2,
    city1 as city,
    post_code1 as postal_code,
    street as street,
    house_num1 as house_number,
    country as country_key,
    region as region,
    time_zone as time_zone,
    tel_number as telephone,
    fax_number as fax,
    langu as language_key,
    sort1 as sort_field_1
from source
