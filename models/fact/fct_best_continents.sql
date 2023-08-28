WITH filtered_players AS (
    SELECT 
        "CONTINENT",
        CAST("Fifa Score" AS INT) AS "Fifa Score"
    FROM {{ ref('inter_all_players_info') }}
    WHERE ("CONTINENT" LIKE '%America%' OR "CONTINENT" LIKE 'Europe') 
      AND CAST("Fifa Score" AS INT) >= 80
)

SELECT 
    "CONTINENT",
    ROUND(AVG("Fifa Score"), 2) AS "Score"
FROM filtered_players
GROUP BY "CONTINENT"
ORDER BY "Score" DESC