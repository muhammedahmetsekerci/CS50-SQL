CREATE TABLE Users(
    "id" INTEGER,
    "first_name" TEXT,
    "last name" TEXT,
    "username" TEXT,
    "password" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE Schools(
    "id" INTEGER,
    "name" TEXT,
    "type" TEXT,
    "location" TEXT,
    "year" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE Companies (
    "id" INTEGER,
    "name" TEXT,
    "sector" TEXT,
    "location" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE ConnectionswithPeople(
    "id" INTEGER,
    "user_id" INTEGER,
    FOREIGN KEY("user_id") REFERENCES "Users"("id")
);

CREATE TABLE ConnectionswithSchools(
    "id" INTEGER,
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start_date" NUMERIC,
    "end_date" NUMERIC,
    "degree" TEXT,
    FOREIGN KEY("user_id") REFERENCES "Users"("id"),
    FOREIGN KEY("school_id") REFERENCES "Schools"(id)
);

CREATE TABLE ConnectionswithCompanies(
    "id" INTEGER,
    "user_id" INTEGER,
    "Company_id" INTEGER,
    "start_date" NUMERIC,
    "end_date" NUMERIC,
    "degree" TEXT,
    FOREIGN KEY("user_id") REFERENCES "Users"("id"),
    FOREIGN KEY("company_id") REFERENCES "Companies"("id")
);

