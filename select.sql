SELECT *  
FROM "users" WHERE "is_male"= true; 

SELECT "id","first_name", "email", "height","is_male"  
FROM "users" WHERE "first_name"='Martin'; 

SELECT "id","first_name", "birthday", "is_male"  
FROM "users" WHERE age("birthday")>make_interval(30); 

SELECT "id","first_name", "birthday", "is_male"  
FROM "users" WHERE "is_male"=true 
AND age("birthday") BETWEEN make_interval(40) AND make_interval(50); 

SELECT "id","first_name", "height"  
FROM "users" WHERE "height">1.9; 

SELECT "id","first_name", "birthday", "is_male"  
FROM "users" WHERE  EXTRACT('day' from "birthday")=31; 
SELECT "birthday","height", "is_male"  
FROM "users" WHERE "is_male"=true AND age("birthday")>make_interval(35) AND "height">1.87;

SELECT "id","first_name", "is_male", "birthday" 
FROM "users" WHERE "first_name"='Anna' AND age("birthday")<make_interval(30); 

SELECT "height","first_name", "is_male", "birthday" 
FROM "users" WHERE "is_male"=true AND age("birthday") BETWEEN make_interval(18) AND make_interval(25) AND "height">1.7; 
