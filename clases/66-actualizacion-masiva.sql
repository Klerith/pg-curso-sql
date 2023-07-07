-- Table Definition
CREATE TABLE "public"."country_bk" (
    "code" bpchar NOT NULL,
    "name" text NOT NULL,
    "continent" text NOT NULL CHECK ((continent = 'Asia'::text) OR (continent = 'South America'::text) OR (continent = 'North America'::text) OR (continent = 'Oceania'::text) OR (continent = 'Antarctica'::text) OR (continent = 'Africa'::text) OR (continent = 'Europe'::text) OR (continent = 'Central America'::text)),
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


INSERT INTO country_bk
SELECT
	*
FROM
	country;


SELECT * from country_bk;

SELECT * from country;

alter table country drop CONSTRAINT country_continent_check;


select 
	a.name, a.continent,
	( select "code" from continent b where b.name = a.continent )
from country a;


update country a
set continent = ( select "code" from continent b where b.name = a.continent );

select * from country;









