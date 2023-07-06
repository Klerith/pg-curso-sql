SELECT
	*
FROM
	country;

ALTER TABLE country
	ADD CHECK (surfacearea >= 0);