with source as (select * from {{source('raw_sap','t005t')}} where mandt = 100)
SELECT
    SPRAS AS language_key,
    LAND1 AS country_key,
    LANDX AS country_name,
    LANDX50 AS country_name_long
FROM source

