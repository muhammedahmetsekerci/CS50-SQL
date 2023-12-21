CREATE VIEW by_district AS
    SELECT "district",sum("families") AS "families",sum("households") AS "households", sum("population") AS "population",sum("male") AS "male",sum("female") AS "female"
    FROM "census" GROUP BY "district";