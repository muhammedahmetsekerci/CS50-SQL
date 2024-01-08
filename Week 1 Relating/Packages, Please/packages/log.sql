
-- *** The Lost Letter ***
SELECT * FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM packages 
        WHERE (from_address_id = (SELECT "id" FROM "addresses" WHERE "address" = "900 Somerville Avenue"))
        AND (to_address_id = (SELECT "id" FROM "addresses" WHERE "address" = "2 Finnigan Street"))
);

select * from packages where id = 384;

select * from addresses where id = 854;

-- *** The Devious Delivery ***
SELECT "contents" FROM "packages" WHERE "from_address_id" IS NULL;

SELECT "type" FROM "addresses" WHERE "id" = (
    SELECT "address_id" FROM "scans" WHERE "package_id" = 
    (SELECT "package_id" FROM "scans" WHERE "address_id" = (SELECT "to_address_id" FROM "packages" WHERE "from_address_id" IS NULL) AND "action" = 'Pick') AND "action" = 'Drop'
);

-- *** The Forgotten Gift ***
select * from scans where package_id = (
    select "id" from packages where "from_address_id" = (select "id" from addresses where "address" = "109 Tileston Street")
);

select "address" from addresses where id = 7432;

select * from drivers where id = 17;


