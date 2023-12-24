CREATE VIEW "available" AS
     SELECT "listings"."id","listings"."property_type","listings"."host_name","listings"."bedrooms","availabilities"."date" AS "available_date" 
     FROM "listings"
     JOIN "availabilities" ON "listings"."id" = "availabilities"."listing_id"
     WHERE "availabilities"."available" = "TRUE"
     GROUP BY "listings"."id";