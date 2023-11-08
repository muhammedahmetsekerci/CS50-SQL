SELECT "players"."first_name","players"."last_name", (("salaries"."salary")/("performances"."H")) AS "dollars per hit" FROM "salaries"
JOIN "performances" ON  "salaries"."player_id" = "performances"."player_id" AND "performances"."year" = "salaries"."year"
JOIN "players" ON "performances"."player_id" = "players"."id" 
WHERE "performances"."year" = 2001 AND "dollars per hit" IS NOT NULL
ORDER BY "dollars per hit" ,"players"."first_name","players"."last_name" LIMIT 10;
