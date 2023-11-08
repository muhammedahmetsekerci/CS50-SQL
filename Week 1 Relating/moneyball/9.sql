SELECT DISTINCT "teams"."name", ROUND((SUM("salary")/COUNT("team_id")),2) AS "average salary" FROM "salaries"
JOIN "teams" ON "salaries"."team_id" = "teams"."id" 
WHERE "salaries"."year" = 2001 
GROUP BY "teams"."id"
ORDER BY "average salary" ASC LIMIT 5;

