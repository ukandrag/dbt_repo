with
    material_general as (select * from {{ ref("stg_mara") }}),

    material_text as (select * from {{ ref("stg_makt") }} where language_key = 'EN'),

    material_plant as (select * from {{ ref("stg_marc") }})

select
    mg.material_number,
    mt.material_description,
    mg.material_type,
    case
        mg.material_type
        when 'FERT'
        then 'Finished Product'
        when 'HALB'
        then 'Semi-Finished'
        when 'ROH'
        then 'Raw Material'
        when 'HIBE'
        then 'Operating Supplies'
        when 'DIEN'
        then 'Service'
        else mg.material_type
    end as material_type_text,
    mg.industry_sector,
    mg.material_group,
    mg.base_unit_of_measure,
    mg.gross_weight,
    mg.net_weight,
    mg.weight_unit,
    mg.volume,
    mg.volume_unit,
    mg.division,
    mg.product_hierarchy,
    mg.ean_upc,
    mg.created_date,
    mg.deletion_flag,
    mg.cross_plant_status,

    -- Plant-level data
    mp.plant,
    mp.mrp_type,
    mp.mrp_controller,
    mp.procurement_type,
    case
        mp.procurement_type
        when 'E'
        then 'In-House Production'
        when 'F'
        then 'External Procurement'
        when 'X'
        then 'Both'
        else mp.procurement_type
    end as procurement_type_text,
    mp.purchasing_group,
    mp.planned_delivery_days,
    mp.valuation_class

from material_general mg

left join material_text mt on mg.material_number = mt.material_number

left join material_plant mp on mg.material_number = mp.material_number
