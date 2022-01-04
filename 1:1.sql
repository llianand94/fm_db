
CREATE TABLE "team"(
  "id" serial PRIMARY KEY,
  "name" VARCHAR(128) NOT NULL CHECK("name" !='')
);
CREATE TABLE "coach"(
  "id" serial PRIMARY KEY,
  "name" VARCHAR(128) NOT NULL CHECK("name" !=''),
  "teamId" INT REFERENCES "team"("id")
);


ALTER TABLE "team"
ADD COLUMN "coachId" INT REFERENCES "coach"("id");