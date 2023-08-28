
WITH players_cte AS (
    SELECT * FROM fifa.dbt_mhmouda_csv.players
)


SELECT 
  "Name",
  "Age",
  "Nationality",
  "Fifa Score",
  "Club",
  
  CASE
    WHEN "Value" LIKE '€%K' THEN
      REPLACE(REPLACE("Value", '€', ''), 'K', '')::NUMBER * 1000
    WHEN "Value" LIKE '€%M' THEN
      REPLACE(REPLACE("Value", '€', ''), 'M', '')::NUMBER * 1000000
  END AS "Value",

  REPLACE(REPLACE("Salary", '€', ''), 'K', '')::NUMBER * 1000 AS "Salary"

FROM players_cte