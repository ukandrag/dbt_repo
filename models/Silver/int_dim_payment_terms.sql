with
    stg_t052_t as (select * from {{ ref("stg_t052") }}),
    stg_t052u_t as (select * from {{ ref("stg_t052u") }} where language_key = 'EN')
select
    t.payment_terms_key,
    u.payment_terms_text,
    t.discount_percent_1,
    t.discount_days_1,
    t.discount_percent_2,
    t.discount_days_2,
    t.net_payment_days

from stg_t052_t t

left join stg_t052u_t u on t.payment_terms_key = u.payment_terms_key
