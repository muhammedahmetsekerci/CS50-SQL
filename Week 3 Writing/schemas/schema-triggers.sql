CREATE TABLE "collections" (
    "id" INTEGER,
    "title" TEXT NOT NULL,
    "accession_number" TEXT NOT NULL UNIQUE,
    "acquired" NUMERIC,
    PRIMARY KEY("id")
);

INSERT INTO "collections" ("title", "accession_number", "acquired")
VALUES 
('Farmers working at dawn', '11.6152', '1911-08-03'),
('Imaginative landscape', '56.496', NULL),
('Profusion of flowers', '56.257', '1956-04-12'),
('Spring outing', '14.76', '1914-01-08');

CREATE TABLE "artists" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    PRIMARY KEY("id")
);

INSERT INTO "artists" ("name") 
VALUES 
('Li Yin'),
('Qian Weicheng'),
('Unidentified artist'),
('Zhou Chen');

CREATE TABLE "created" (
    "artist_id" INTEGER,
    "collection_id" INTEGER,
    PRIMARY KEY("artist_id", "collection_id"),
    FOREIGN KEY("artist_id") REFERENCES "artists"("id") ON DELETE CASCADE,
    FOREIGN KEY("collection_id") REFERENCES "collections"("id") ON DELETE CASCADE
);

INSERT INTO "created" ("artist_id", "collection_id")
VALUES 
((SELECT "id" FROM "artists" WHERE "name" = 'Li Yin'), (SELECT "id" FROM "collections" WHERE "title" = 'Imaginative landscape')),
((SELECT "id" FROM "artists" WHERE "name" = 'Qian Weicheng'), (SELECT "id" FROM "collections" WHERE "title" = 'Profusion of flowers')),
((SELECT "id" FROM "artists" WHERE "name" = 'Unidentified artist'), (SELECT "id" FROM "collections" WHERE "title" = 'Farmers working at dawn')),
((SELECT "id" FROM "artists" WHERE "name" = 'Zhou Chen'), (SELECT "id" FROM "collections" WHERE "title" = 'Spring outing'));
