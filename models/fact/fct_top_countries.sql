WITH player_salaries AS (
    SELECT 
        "Nationality",
        SUM("Salary") AS "SalaryIncomes"
    FROM {{ ref('inter_all_players_info') }}
    GROUP BY "Nationality"
)

SELECT 
    "Nationality",
    "SalaryIncomes"
FROM player_salaries
ORDER BY "SalaryIncomes" DESC
LIMIT 3