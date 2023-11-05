SELECT "districts"."name" FROM "districts" JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
ORDER BY "expenditures"."pupils" ASC LIMIT 1;

