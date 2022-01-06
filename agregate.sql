SELECT *
FROM "users";

SELECT min("weight")
FROM "users";

SELECT avg("weight"),"first_name"
FROM "users"
GROUP BY "first_name"
WHERE "is_male"=false AND "id"%2=0;

SELECT count("id"),"is_male"
FROM "users"
WHERE "is_male"= true
GROUP BY "is_male";

SELECT avg("height") AS "Average height", 
"is_male" AS "Gender"
FROM "users"
GROUP BY "is_male" ;

SELECT min("weight") AS "Min Weight",
"is_male" AS "Gender"
FROM "users"
GROUP BY "is_male";

SELECT count("id")
FROM "users"
WHERE EXTRACT('year' FROM "birthday")=1982;

SELECT count("id"),"last_name"
FROM "users"
WHERE "last_name" IN('Anderson', 'Andersen')
GROUP BY "last_name"
;

SELECT count("id")
FROM "users"
WHERE EXTRACT('month' FROM "birthday")=5 AND EXTRACT('day' FROM "birthday")=11; 

SELECT sum("weight")
FROM "users"
WHERE "first_name"='Anna';

SELECT count("id"),"is_male" AS "Gender", "height"
FROM "users"
WHERE "is_male"=true AND "height">1.8
GROUP BY "is_male", "height";