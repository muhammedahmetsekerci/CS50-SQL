-- Drop tables
DROP TABLE IF EXISTS "user_logs";
DROP TABLE IF EXISTS "orders";
DROP TABLE IF EXISTS "items";
DROP TABLE IF EXISTS "users";

-- Drop triggers
DROP TRIGGER IF EXISTS "log_user_updates";
DROP TRIGGER IF EXISTS "log_user_deletes";
DROP TRIGGER IF EXISTS "log_user_inserts";

-- Clean up unused space
VACUUM;

-- Create tables
CREATE TABLE "users" (
    "id" INTEGER,
    "username" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "user_logs" (
    "id" INTEGER,
    "type" TEXT NOT NULL,
    "old_username" TEXT,
    "new_username" TEXT,
    "old_password" TEXT,
    "new_password" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "items" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "price" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "orders" (
    "id" INTEGER,
    "user_id" INTEGER,
    "item_id" INTEGER,
    "quantity" INTEGER NOT NULL CHECK("quantity" > 0),
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("item_id") REFERENCES "items"("id")
);

CREATE TRIGGER "log_user_updates"
AFTER UPDATE OF "username", "password" ON "users"
FOR EACH ROW
BEGIN
    INSERT INTO "user_logs" ("type", "old_username", "new_username", "old_password", "new_password")
    VALUES ('update', OLD."username", NEW."username", OLD."password", NEW."password");
END;

CREATE TRIGGER "log_user_deletes"
AFTER DELETE ON "users"
FOR EACH ROW
BEGIN
    INSERT INTO "user_logs" ("type", "old_username", "new_username", "old_password", "new_password")
    VALUES ('delete', OLD."username", NULL, OLD."password", NULL);
END;

CREATE TRIGGER "log_user_inserts"
AFTER INSERT ON "users"
FOR EACH ROW
BEGIN
    INSERT INTO "user_logs" ("type", "old_username", "new_username", "old_password", "new_password")
    VALUES ('insert', NULL, NEW."username", NULL, NEW."password");
END;

INSERT INTO "users" ("id", "username", "password")
VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e'),
('2', 'emily33', '44bf025d27eea66336e5c1133c3827f7'),
('3', 'zad28', '185f20cc5599d33a1a94eb426112c78a'),
('4', 'mario17', 'ccce73b2ef30ecf08c9cf0e802fa9149'),
('5', 'ezra2', 'dbbe590bcc018ea53ca04caf89e0a98c'),
('6', 'varsha15', '9ce87254bdeb236140b9f16382e88589'),
('7', 'jonathan30', 'ce4db146e55cd5518a337dbadffc7a45'),
('8', 'dalila20', 'f73bbedf4dcabf7504b6e7358dd60c79'),
('9', 'jennifer18', '3cb8c29b3106e0f395fbbdb9ed9d7eb6'),
('10', 'carina10', '350bbcfcc4b17d00c6df46165bac7d10'),
('11', 'ezra1', '69c3b6a36e59489ad39c7c33c72c49e5'),
('12', 'inko7', '45820bdca62a604d8a634b2913b30f63'),
('13', 'emily12', '68329a186167a2816b77a9bd4f2142d6'),
('14', 'ivy29', '6f6587dbfca09704147bbe94309689e1'),
('15', 'rebeca15', '0c0d7b705c8f4f48bff1842b63b5a280'),
('16', 'patrick20', '649cd60b242e87f39fc2980c14ffde88'),
('17', 'mikel18', '08202223c7f962d9738454fae63e714e'),
('18', 'erin14', 'c0281fb1f443be78c579c5eb88bddfda'),
('19', 'isabel0', '1cc19db8c596327e6924d28a78a1b099'),
('20', 'aaron13', '9930bb254af746d84cbfa221985fa439'),
('21', 'clara16', '9df7d267cb869ee059e93afb6a08660a'),
('22', 'jocelyn2', '592f1299768248a0d13ab2c55e8d51f5'),
('23', 'clara25', 'f65015d784f2ba7c2b4cf47e4d8916bf'),
('24', 'patrick10', '9cbd6ca6f521d20f6d1c22d40a107047'),
('25', 'paul27', '7d0c8fa06ff6e9cbd55775ac4838f508'),
('26', 'yang0', '18630c2d0c6a1c1862b5b5a2869ef342'),
('27', 'ezra23', 'e528c5ce4c19fc1064ade21475cddf4c'),
('28', 'jocelyn16', 'fabcb49723fb2e0b4683c3a2626ea220'),
('29', 'elizabeth7', '7272d39766a37bca8967e251916f9665'),
('30', 'jennifer17', 'd7adc2936b9e2680d5d977c89b9f21bd'),
('31', 'dhrub2', '9bc042600ae8741069cfc116b065093b'),
('32', 'brave4', 'e82c138ff1e38744b73d510da3d8d185'),
('33', 'carina1', 'c0394056b7b0ded02b3ddee88b988bd7'),
('34', 'yang11', '361bc487a4079079ab0f6558b454c35a'),
('35', 'clara9', 'c706892f7a54eba297ea94c8ebdce47d'),
('36', 'inno5', '933c2f41371d13982832a97020304d73'),
('37', 'jacob15', '8d65e694c01878a543970fa134248db7'),
('38', 'josh22', '36705480e31e308131a2e673cae2d969'),
('39', 'julianna0', 'ee079a517583028835251df2c68e639b'),
('40', 'vanessa2', '5a6faeb4f307e28b83470f772f45ccc8'),
('41', 'alyssa10', '763524b49741e002a653a6f4d769bd53'),
('42', 'rachna25', '15ced43952ed37b6cc1e7fbb541226e2'),
('43', 'elizabeth3', '54302540de7c69cea3470df9ca8e0a5d'),
('44', 'jared24', 'c4fcae955dd618aa7e44ebf63dbc9092'),
('45', 'grace15', '66fd5febb0fbe65e8ca14bf67fb263cd'),
('46', 'erin28', '4ef7b2cc7615b90c7bf122e978659ed0'),
('47', 'michael14', '453e95ea5a1027d76585d74ba526bd94'),
('48', 'samuel8', '873cbddd95f9bc3f38763acf1a2fb42b'),
('49', 'kyra13', '1ecf27e248c05f938bd5354e539b6d1f'),
('50', 'adam1', '2136622ffb4269f1fdb6264266b4711b');

INSERT INTO "items" ("id", "name", "price")
VALUES ('1', 'CS50 Rubber Duck', '4.99'),
('2', 'CS50 Pen', '4.99'),
('3', 'CS50 Sunglasses', '9.99'),
('4', 'CS50 Unisex T-Shirt', '30.00'),
('5', 'CS50 Hoodie', '42.00'),
('6', 'CS50 Toddler Shirt', '20.00'),
('7', 'CS50 Pillow', '28.00'),
('8', 'CS50 Mug', '14.00'),
('9', 'CS50 Embroidered Beanie', '24.00'),
('10', 'CS50 Kids T-Shirt', '25.00');

INSERT INTO "orders" ("id", "user_id", "item_id", "quantity")
VALUES ('1', '37', '5', '1'),
('2', '33', '5', '7'),
('3', '38', '6', '10'),
('4', '48', '3', '5'),
('5', '27', '6', '7'),
('6', '24', '6', '1'),
('7', '20', '9', '3'),
('8', '45', '1', '1'),
('9', '14', '8', '7'),
('10', '21', '10', '9'),
('11', '21', '10', '4'),
('12', '31', '4', '10'),
('13', '31', '6', '6'),
('14', '41', '2', '4'),
('15', '35', '8', '3'),
('16', '5', '10', '3'),
('17', '7', '2', '1'),
('18', '44', '3', '5'),
('19', '34', '1', '8'),
('20', '29', '8', '6'),
('21', '8', '8', '8'),
('22', '9', '5', '8'),
('23', '10', '3', '10'),
('24', '39', '5', '4'),
('25', '24', '10', '2'),
('26', '44', '9', '2'),
('27', '37', '6', '3'),
('28', '44', '2', '1'),
('29', '28', '5', '2'),
('30', '35', '3', '9'),
('31', '11', '3', '3'),
('32', '42', '3', '9'),
('33', '20', '4', '3'),
('34', '38', '10', '4'),
('35', '34', '3', '5'),
('36', '26', '7', '9'),
('37', '23', '8', '4'),
('38', '27', '6', '3'),
('39', '10', '5', '7'),
('40', '11', '10', '5'),
('41', '34', '2', '4'),
('42', '5', '6', '1'),
('43', '11', '7', '6'),
('44', '45', '5', '1'),
('45', '18', '4', '10'),
('46', '16', '6', '5'),
('47', '7', '5', '6'),
('48', '19', '6', '1'),
('49', '34', '5', '5'),
('50', '29', '5', '4'),
('51', '22', '8', '5'),
('52', '35', '4', '9'),
('53', '6', '3', '5'),
('54', '26', '10', '5'),
('55', '38', '3', '2'),
('56', '9', '9', '4'),
('57', '36', '5', '3'),
('58', '25', '5', '8'),
('59', '39', '5', '3'),
('60', '46', '1', '3'),
('61', '49', '6', '1'),
('62', '7', '8', '4'),
('63', '5', '9', '10'),
('64', '10', '2', '5'),
('65', '29', '7', '3'),
('66', '18', '1', '3'),
('67', '3', '3', '2'),
('68', '38', '6', '10'),
('69', '38', '6', '4'),
('70', '13', '7', '6'),
('71', '10', '1', '8'),
('72', '8', '10', '8'),
('73', '20', '4', '6'),
('74', '30', '6', '6'),
('75', '29', '7', '6'),
('76', '3', '6', '3'),
('77', '20', '10', '5'),
('78', '2', '7', '9'),
('79', '23', '9', '1'),
('80', '19', '2', '3'),
('81', '20', '3', '9'),
('82', '40', '4', '8'),
('83', '40', '4', '8'),
('84', '10', '6', '6'),
('85', '10', '9', '3'),
('86', '14', '10', '2'),
('87', '19', '3', '4'),
('88', '5', '10', '4'),
('89', '8', '3', '6'),
('90', '18', '7', '4'),
('91', '4', '5', '9'),
('92', '3', '3', '4'),
('93', '37', '6', '5'),
('94', '13', '5', '1'),
('95', '5', '8', '8'),
('96', '28', '6', '1'),
('97', '22', '3', '8'),
('98', '35', '6', '6'),
('99', '44', '5', '4'),
('100', '29', '5', '7');

UPDATE "users"
SET "password" = '5f4dcc3b5aa765d61d8327deb882cf99'
WHERE "username" = 'jacob15'
