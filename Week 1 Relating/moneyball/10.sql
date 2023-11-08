SELECT "first_name","last_name","salary","HR", "performances"."year"  AS "year" FROM "performances"
JOIN "players" ON "players"."id" = "performances"."player_id"
JOIN "salaries" ON "players"."id" = "salaries"."player_id" AND "performances"."year" = "salaries"."year"
ORDER BY "players"."id" ASC,"salaries"."year" DESC,"performances"."HR" DESC,"salaries"."salary"DESC;
