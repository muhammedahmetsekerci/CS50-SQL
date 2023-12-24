CREATE VIEW total AS
    SELECT sum("families") AS "families",sum("households") AS "households", sum("population") AS "population",sum("male") AS "male",sum("female") AS "female"
    FROM "census"; 