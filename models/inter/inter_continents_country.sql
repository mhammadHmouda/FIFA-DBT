WITH
    continent_countries AS (
        SELECT
            c.name as continent,
            co.name as country
        FROM
            {{ ref('stg_continents') }} c
        JOIN
            {{ ref('stg_countries') }} co
        ON
            c.code = co.continent_code
    )

SELECT
    cc.* 
FROM
    continent_countries cc