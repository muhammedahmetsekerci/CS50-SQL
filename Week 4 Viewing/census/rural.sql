CREATE VIEW "rural" AS 
    SELECT * FROM "census" WHERE "locality" LIKE '%Rural%';