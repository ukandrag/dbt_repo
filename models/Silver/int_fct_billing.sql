with
    stg_vbrk_t as (select * from {{ ref("stg_vbrk") }}),
    stg_vbrp_t as (select * from {{ ref("stg_vbrp") }})
select
    h.billing_document,
    i.item_number,
    h.billing_type,
    h.billing_category,
    h.billing_date,
    h.created_date,
    h.company_code,
    h.sales_organization,
    h.distribution_channel,
    h.division,
    h.document_currency,
    h.payer,
    h.sold_to_party as customer_number,
    h.payment_terms,
    h.fiscal_year,
    h.accounting_document,
    h.reference_document,
    h.cancelled_flag,
    h.country_key,
    h.exchange_rate,

    -- Item details
    i.material_number,
    i.item_description,
    i.item_category,
    i.billed_quantity,
    i.sales_unit,
    i.net_value as item_net_value,
    i.tax_amount as item_tax_amount,
    i.plant,
    i.material_group,
    i.product_hierarchy,
    i.sales_order,
    i.sales_order_item,
    i.profit_center,
    i.cost_center,
    i.business_area,
    i.subtotal_1,
    i.cost_value,

    -- Header totals
    h.net_value as billing_net_value,
    h.tax_amount as billing_tax_amount,
    h.net_value + h.tax_amount as billing_gross_value,

    -- Derived
    case when h.cancelled_flag = 'X' then true else false end as is_cancelled,
    case
        h.billing_type
        when 'F2'
        then 'Invoice'
        when 'RE'
        then 'Credit Memo'
        when 'L2'
        then 'Debit Memo'
        when 'S1'
        then 'Cancellation'
        else h.billing_type
    end as billing_type_text

from stg_vbrk_t h

inner join stg_vbrp_t i 
on h.billing_document = i.billing_document
