with 
    stg_vbak as (select * from {{ref('stg_vbak')}}),

    stg_vbap as (select * from {{ref('stg_vbap')}}),

    stg_vbup as (select * from {{ref('stg_vbup')}}),

    stg_vbuk as (select * from {{ref('stg_vbuk')}})

SELECT
    h.sales_document,
    i.item_number,
    h.document_type,
    CASE h.document_type
        WHEN 'OR' THEN 'Standard Order'
        WHEN 'SO' THEN 'Rush Order'
        WHEN 'RE' THEN 'Return Order'
        WHEN 'QT' THEN 'Quotation'
        WHEN 'CR' THEN 'Credit Memo Request'
        ELSE h.document_type
    END AS document_type_text,
    h.created_date,
    h.document_date,
    h.sold_to_party AS customer_number,
    h.sales_organization,
    h.distribution_channel,
    h.division,
    h.sales_office,
    h.sales_group,
    h.document_currency,
    h.purchase_order_number,
    h.incoterms_1,
    h.incoterms_2,
    h.payment_terms,
    h.requested_delivery_date,
    h.delivery_block,
    h.billing_block,

    -- Item details
    i.material_number,
    i.item_description,
    i.item_category,
    i.order_quantity,
    i.sales_unit,
    i.net_price,
    i.net_value AS item_net_value,
    i.plant,
    i.storage_location,
    i.material_group,
    i.product_hierarchy,
    i.rejection_reason,
    i.business_area,

    -- Header net value
    h.net_value AS order_net_value,

    -- Item status
    ist.delivery_status AS item_delivery_status,
    ist.billing_status AS item_billing_status,
    ist.overall_processing_status AS item_overall_status,
    ist.goods_movement_status AS item_goods_movement_status,
    ist.rejection_status AS item_rejection_status,

    -- Header status
    hst.overall_status AS order_overall_status,
    hst.delivery_status AS order_delivery_status,
    hst.billing_status AS order_billing_status,
    hst.credit_status AS order_credit_status,

    -- Derived flags
    CASE WHEN i.rejection_reason IS NOT NULL AND i.rejection_reason != '' THEN TRUE ELSE FALSE END AS is_rejected,
    CASE WHEN h.delivery_block IS NOT NULL AND h.delivery_block != '' THEN TRUE ELSE FALSE END AS is_delivery_blocked,
    CASE WHEN h.billing_block IS NOT NULL AND h.billing_block != '' THEN TRUE ELSE FALSE END AS is_billing_blocked

FROM stg_vbak h

INNER JOIN stg_vbap  i
    ON h.sales_document = i.sales_document

LEFT JOIN stg_vbup ist
    ON i.sales_document = ist.sales_document
    AND i.item_number = ist.item_number

LEFT JOIN stg_vbuk hst
    ON h.sales_document = hst.sales_document    
      