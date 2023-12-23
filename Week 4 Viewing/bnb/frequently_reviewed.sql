CREATE VIEW "frequently_reviewed" AS
    SELECT "listings"."id","listings"."property_type","listings"."host_name",COUNT("reviews"."reviewer_name") AS "reviews" FROM "listings"
    JOIN "reviews" ON "listings"."id" = "reviews"."listing_id" GROUP BY "reviews"."listing_id" ORDER BY "reviews" desc,"listings"."property_type","listings"."host_name" LIMIT 100;
