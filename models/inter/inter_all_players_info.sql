 WITH
    all_players_info AS (
        SELECT
            p.*,
            cc.continent
        FROM
            {{ ref('stg_players') }} p
        JOIN
            {{ ref('inter_continents_country') }} cc
        ON
            p."Nationality" = cc.country
    )

SELECT 
    * 
FROM
    all_players_info