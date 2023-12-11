CREATE TABLE Passengers(
    "id" INTEGER
    "fist_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE Check_Ins(
    "id" INTEGER,
    "datetime" NUMERIC NOT NULL,
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("flight_id") REFERENCES "Flights"("id"),
    FOREIGN KEY("passenger_id") REFERENCES "Passengers"("id")
);

CREATE TABLE Airlines(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "section",
    PRIMARY KEY("id")
);

CREATE TABLE Flights(
    "id" INTEGER,
    "departing_airline_code" TEXT NOT NULL,
    "Check-in_id" int,
    "departure_datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expected_arrival_datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("Check-in_id") REFERENCES "Check_Ins"("id")
);