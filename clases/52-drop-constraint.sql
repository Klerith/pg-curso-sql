SELECT
	*
FROM
	country
WHERE
	code = 'HND';

ALTER TABLE country
	ADD CHECK (surfacearea >= 0);

SELECT DISTINCT
	continent
FROM
	country;

ALTER TABLE country
	ADD CHECK ((continent = 'Asia'::text)
			or(continent = 'South America'::text)
				or(continent = 'North America'::text)
					or(continent = 'Oceania'::text)
						or(continent = 'Antarctica'::text)
							or(continent = 'Africa'::text)
								or(continent = 'Europe'::text)
									or(continent = 'Central America'::text));

ALTER TABLE country DROP CONSTRAINT "country_continent_check7";



-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.
-- Table Definition
CREATE TABLE "public"."country" (
	"code" bpchar NOT NULL,
	"name" text NOT NULL,
	"continent" text NOT NULL CHECK ((continent = 'Asia'::text)
		OR(continent = 'South America'::text)
		OR(continent = 'North America'::text)
		OR(continent = 'Oceania'::text)
		OR(continent = 'Antarctica'::text)
		OR(continent = 'Africa'::text)
		OR(continent = 'Europe'::text)
		OR(continent = 'Central America'::text)),
	"region" text NOT NULL,
	"surfacearea" float4 NOT NULL CHECK (surfacearea >= (0)::double precision),
	"indepyear" int2,
	"population" int4 NOT NULL,
	"lifeexpectancy" float4,
	"gnp" numeric,
	"gnpold" numeric,
	"localname" text NOT NULL,
	"governmentform" text NOT NULL,
	"headofstate" text,
	"capital" int4,
	"code2" bpchar NOT NULL,
	PRIMARY KEY ("code")
);