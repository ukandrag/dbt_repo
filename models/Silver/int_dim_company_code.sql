with
    stg_t001_t as (select * from {{ ref("stg_t001") }}),
    stg_t005t_t as (select * from {{ ref("stg_t005t") }} where language_key = 'EN')
select
    t.company_code,
    t.company_name,
    t.city,
    t.country_key,
    ct.country_name,
    t.local_currency,
    t.chart_of_accounts,
    t.fiscal_year_variant,
    t.vat_registration_no

from stg_t001_t t

left join stg_t005t_t ct on t.country_key = ct.country_key
