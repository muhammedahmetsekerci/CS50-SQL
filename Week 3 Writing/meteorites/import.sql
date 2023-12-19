CREATE TABLE "meteorites_temp"(
  "name" TEXT,
  "id" INTEGER,
  "nametype" TEXT,
  "class" TEXT,
  "mass" INTEGER,
  "discovery" TEXT,
  "year" INTEGER,
  "lat" INTEGER,
  "long" INTEGER,
  primary key("id")
);

.import --csv --skip 1 meteorites.csv meteorites_temp

UPDATE "meteorites_temp" SET "mass" = NULL WHERE "mass" = "";
UPDATE "meteorites_temp" SET "year" = NULL WHERE "year" = "";
UPDATE "meteorites_temp" SET "lat" =  NULL WHERE "lat" = "";
UPDATE "meteorites_temp" SET "long" = NULL WHERE "long" = "";

UPDATE "meteorites_temp" SET "mass" = ROUND("mass",1);
UPDATE "meteorites_temp" SET "lat" = ROUND("lat",1);
UPDATE "meteorites_temp" SET "long" = ROUND("long",1);

DELETE FROM "meteorites_temp" WHERE "nametype" = "Relict";

ALTER TABLE "meteorites_temp" DROP COLUMN "nametype";


CREATE TABLE "meteorites"(
  "id" INTEGER,
  "name" TEXT,
  "class" TEXT,
  "mass" INTEGER,
  "discovery" TEXT,
  "year" INTEGER,
  "lat" INTEGER,
  "long" INTEGER,
  primary key("id")
);

INSERT INTO "meteorites" ("name","class","mass","discovery","year","lat","long") SELECT "name","class","mass","discovery","year","lat","long" FROM "meteorites_temp" ORDER BY "year","name";

drop table "meteorites_temp";
