CREATE VIEW "most_populated" AS 
    SELECT "district","families","households","population","male","female"
    FROM "census" ORDER BY "population" DESC;