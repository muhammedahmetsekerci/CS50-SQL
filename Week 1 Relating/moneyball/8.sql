SELECT "salaries"."salary" FROM "salaries"
JOIN "performances" ON "salaries"."player_id" = "performances"."player_id"
WHERE "performances"."HR" = (
    SELECT MAX("HR") from "performances" 
    WHERE "year" = 2001
)
AND "salaries"."year" = 2001;