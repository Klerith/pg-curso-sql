ALTER TABLE countrylanguage
	ADD CONSTRAINT fk_country_code FOREIGN KEY (countrycode) REFERENCES country (code);

DELETE FROM country
WHERE code = 'AFG';

SELECT
	*
FROM
	city
WHERE
	countrycode = 'AFG';