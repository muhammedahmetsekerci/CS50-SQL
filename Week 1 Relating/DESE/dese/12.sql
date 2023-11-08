SELECT "districts"."name","expenditures"."per_pupil_expenditure", "staff_evaluations"."exemplary"
FROM "districts" JOIN "expenditures" 
ON "districts"."id" = "expenditures"."district_id"
JOIN "staff_evaluations" 
ON "districts"."id" = "staff_evaluations"."district_id"
WHERE "districts"."type" = "Public School District" AND "districts"."state" = "MA"
AND "staff_evaluations"."exemplary" > (SELECT AVG("exemplary") FROM "staff_evaluations") 
AND "expenditures"."per_pupil_expenditure" > (SELECT AVG("per_pupil_expenditure") FROM "expenditures")
ORDER BY "staff_evaluations"."exemplary" DESC,"expenditures"."per_pupil_expenditure" DESC;
