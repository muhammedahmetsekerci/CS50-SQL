CREATE TABLE Ingredients(
    "id" INTEGER,
    "ingredients" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE Donuts(
    "id" INTEGER,
    "ingredient_id" INTEGER,
    "name" TEXT NOT NULL,
    "gluten-free" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("ingredient_id") REFERENCES "Ingredients"("id")
);

CREATE TABLE Orders(
    "id" INTEGER,
    "order_number" INTEGER,
    "donut_id" INTEGER,
    "customer_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("donut_id") REFERENCES "Donuts"("id"),
    FOREIGN KEY("customer_id") REFERENCES "Customers"("id")
);

CREATE TABLE Customers(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last name" TEXT NOT NULL,
    "history_orders_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("history_orders_id") REFERENCES "Orders"("id")
);

