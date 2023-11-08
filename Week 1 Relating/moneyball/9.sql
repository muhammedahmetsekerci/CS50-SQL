SELECT DISTINCT "teams"."name", ROUND((SUM("salary")/COUNT("team_id")),2) AS "average salary" FROM "salaries"
JOIN "teams" ON "salaries"."team_id" = "teams"."id" 
WHERE "salaries"."year" = 2001 
GROUP BY "salaries"."player_id"
ORDER BY "average salary" ASC LIMIT 50;

SELECT * FROM "salaries"
JOIN "teams" ON "salaries"."team_id" = "teams"."id" AND "salaries"."year" = "teams"."year"
WHERE "salaries"."year" = 2001 AND "teams"."id" = 55
GROUP BY "salaries"."player_id"
ORDER BY "average salary" LIMIT 2000;

SELECT SUM("salaries"."salary"),COUNT("team_id") ,"teams"."id",ROUND((SUM("salaries"."salary")/COUNT("team_id")),2) AS "S" FROM "salaries"
JOIN "teams" ON "salaries"."team_id" = "teams"."id" AND "salaries"."year" = "teams"."year"
WHERE "salaries"."year" = 2001 
GROUP BY "salaries"."salary"
ORDER BY "S" LIMIT 50;