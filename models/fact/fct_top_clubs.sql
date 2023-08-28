WITH player_salaries AS (
    SELECT 
        "Club",
        SUM("Salary") AS "SalarySpends"
    FROM {{ ref('inter_all_players_info') }}
    GROUP BY "Club"
)

SELECT 
    "Club",
    "SalarySpends"
FROM player_salaries
ORDER BY "SalarySpends" DESC
LIMIT 5