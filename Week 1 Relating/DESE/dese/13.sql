SELECT "districts"."name","expenditures"."per_pupil_expenditure"
FROM "districts" JOIN "expenditures" 
ON "districts"."id" = "expenditures"."district_id"
WHERE "districts"."state" LIKE '%a%' AND "expenditures"."pupils" > (
    SELECT AVG(pupils) FROM "expenditures"
);