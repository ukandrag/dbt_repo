with source as (select * from {{ source("raw_sap", "mara") }} where mandt = 100)
select
    matnr as material_number,
    erdat as created_date,
    ernam as created_by,
    mtart as material_type,
    mbrsh as industry_sector,
    matkl as material_group,
    meins as base_unit_of_measure,
    bstme as order_unit,
    brgew as gross_weight,
    ntgew as net_weight,
    gewei as weight_unit,
    volum as volume,
    voleh as volume_unit,
    spart as division,
    prdha as product_hierarchy,
    ean11 as ean_upc,
    lvorm as deletion_flag,
    mstae as cross_plant_status,
    mhdrz as total_shelf_life,
    mhdhb as remaining_shelf_life
from source
