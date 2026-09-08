{{
    config(
        materialized="incremental",
        unique_key=["mandt", "pob_id", "posting_period", "post_year", "line_no"],
        cluster_by=["posting_date"] ,
    )
}}
with
    source as (
        select *
        from {{ source("raw_sap", "farr_d_posting") }}        
            {% if is_incremental() %}
           where     coalesce(posting_date, '00000000')
                >= (select max(posting_date) from {{ this }})
            {% endif %}
    )
select
    mandt,
    pob_id,
    contract_id,
    posting_period,
    post_year,
    line_no,
    posting_date,
    betrg,
    crncy,
    category,
    bukrs,
    hkont,
    kostl,
    prctr,
    erdat,
    ernam,
    case
        category
        when 'REV'
        then 'REVENUE'
        when 'DEF'
        then 'DEFERRED'
        when 'REC'
        then 'RECEIVABLE'
        else ''
    end as posting_category
from
    source

    -- -----In Incremental, if we need to handle DELETE as well then below is how we
    -- implement this scenario.
    -- post_hook = [
    -- "
    -- DELETE FROM {{ this }} t
    -- WHERE NOT EXISTS (
    -- SELECT 1
    -- FROM {{ source('raw_sap', 'farr_d_posting') }} s
    -- WHERE t.mandt = s.mandt
    -- AND t.pob_id = s.pob_id
    -- AND t.posting_period = s.posting_period
    -- AND t.post_year = s.post_year
    -- AND t.line_no = s.line_no
    -- )
    -- "
    -- ]
    
