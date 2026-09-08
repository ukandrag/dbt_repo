with source as (select * from {{source('raw_sap','makt')}} where mandt = 100)
SELECT
    MATNR AS material_number,
    SPRAS AS language_key,
    MAKTX AS material_description,
    MAKTG AS material_description_upper
FROM
    source