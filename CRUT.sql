ALTER TABLE "users"
ADD COLUMN "weight" INT CHECK("weight" BETWEEN 0 AND 250);

SELECT * FROM "users";

SELECT *
FROM "users"
WHERE "is_male"=false AND "height" <= 1.45;

UPDATE "users" 
SET "weight" = 55
WHERE "first_name" = 'Anna';

UPDATE "users"
SET "weight" = 250
WHERE "is_male" = true AND "height">= 1.98;

UPDATE "users"
SET "weight" = 40
WHERE "is_male" = false AND "height"<=1.45;

DELETE FROM "users"
WHERE "id" = 1907;

UPDATE "users" 
SET "weight" = 57
WHERE "first_name" = 'Anna'
RETURNING *;

SELECT "id" AS "Number",
  concat("first_name", ' ',"last_name") AS "First last",
  "email"
FROM "users" AS "table"
WHERE "table"."first_name" = 'Anna';


SELECT "id" AS "Number",
  concat("first_name", ' ',"last_name") AS "Full name",
  length(concat("first_name", ' ',"last_name")) AS "length",
  "email"
FROM "users"
WHERE length(concat("first_name", ' ',"last_name"))>9
LIMIT 10;

SELECT *
FROM (
  SELECT "id" AS "Number",
  concat("first_name", ' ',"last_name") AS "Full name",
  length(concat("first_name", ' ',"last_name")) AS "length",
  "email"
  FROM "users") AS "FN"
WHERE "FN"."length" = 9
LIMIT 10;