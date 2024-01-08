SELECT "players"."first_name", "players"."last_name" FROM "performances"
JOIN "players" ON "performances"."player_id" = "players"."id"
JOIN "salaries" ON "performances"."player_id" = "salaries"."player_id" AND "salaries"."year" = "performances"."year"
WHERE "performances"."year" = 2001 
AND (("salaries"."salary")/("performances"."HR")) > (SELECT (("salaries"."salary")/("performances"."HR")) AS "salary/hr" FROM "performances" JOIN "salaries" ON "performances"."year" = "salaries"."year" WHERE "salary/hr" IS NOT NULL AND "performances"."year" = 2001 ORDER BY "salary/hr" LIMIT 10)
AND (("salaries"."salary")/("performances"."RBI")) > (SELECT (("salaries"."salary")/("performances"."RBI")) AS "salary/RBI" FROM "performances" JOIN "salaries" ON "performances"."player_id" = "salaries"."player_id" WHERE "salary/RBI" IS NOT NULL AND "performances"."year" = 2001 ORDER BY "salary/RBI" ASC LIMIT 10)
GROUP BY (("salaries"."salary")/("performances"."HR")),(("salaries"."salary")/("performances"."RBI"))
ORDER BY "performances"."player_id","players"."last_name";
