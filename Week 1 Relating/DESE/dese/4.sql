SELECT "city",COUNT("type") AS "type" FROM "schools" WHERE "type" = "Public School"
GROUP BY city
ORDER BY "type" DESC,city LIMIT 10;
