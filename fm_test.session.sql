
SELECT *
FROM "phones"
ORDER BY "quantity" ASC
LIMIT 100;

SELECT *, EXTRACT("year" from age("birthday")) AS "Age" 
FROM "users"
ORDER BY "Age" ASC, "lastName" ASC;

SELECT EXTRACT("year" from age("birthday")) AS "Age", count(*) 
FROM "users"
GROUP BY "Age"
HAVING count(*)  =1
ORDER BY "Age";

SELECT "id", concat("firstName", ' ', "lastName")
FROM "users"
WHERE "firstName" LIKE 'A%y';

SELECT "id", concat("firstName", ' ', "lastName")
FROM "users"
WHERE "firstName" LIKE 'E%' AND "lastName" LIKE 'M%';

SELECT "id", "firstName", "email", length("email") AS "Length"
FROM "users"
WHERE "email" LIKE 's%' AND length("email") < 25
ORDER BY "Length" ASC;

SELECT "u"."id", "u"."firstName", "u"."lastName", "o"."id" 
FROM "users" AS "u"
  JOIN "orders" AS "o" ON "o"."userId" = "u"."id"
WHERE "u"."id"= 21;

SELECT o."id", p."brand", count(*) AS quantity
FROM "orders" AS o
  JOIN "phones_to_orders" AS pto ON o."id" = pto."orderId"
  JOIN "phones" AS p ON p."id"= pto."phoneId" 
WHERE  p."brand" ILIKE '%Sony%'
GROUP BY o."id", p."brand"
HAVING count(*) = 5
ORDER BY quantity;

INSERT INTO "phones"(
  "brand", "model", "price", "quantity"
) VALUES ('Musk', 'X Elon', 12345656, 2);

SELECT p."brand", p."model"
FROM "phones" AS p
  JOIN "phones_to_orders" AS pto ON pto."phoneId"= p."id"
GROUP BY p."model", p."brand"
ORDER BY p."brand" ASC;  

SELECT u."email", p."brand"
FROM "users" AS u
  JOIN "orders" AS o ON u."id" = o."userId"
  JOIN "phones_to_orders" AS pto ON o."userId"= pto."orderId"
  JOIN "phones" AS p ON pto."phoneId"= p."id"
WHERE p."brand" = 'Iphone'
GROUP BY u."email", p."brand";  

SELECT u."email", count(o."id") AS amount
FROM "users" AS u
 JOIN "orders" AS o ON u."id" = o."userId"
GROUP BY u."email"
HAVING count(o."id") >3
ORDER BY amount; 

SELECT  p."model", pto.*, u."email"
FROM "users" AS u
  JOIN "orders" AS o ON u."id" = o."userId"
  JOIN "phones_to_orders" AS pto ON o."userId"= pto."orderId"
  JOIN "phones" AS p ON pto."phoneId"= p."id"
WHERE p."id" = 33;

SELECT sum(pto."quantity") AS amount, p."model", p."brand"
FROM "phones" AS p
 JOIN "phones_to_orders" AS pto ON p."id" = pto."phoneId"
GROUP BY p."model", p."brand"
ORDER BY amount DESC
LIMIT 1;