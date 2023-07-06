SELECT
	*
FROM
	city
WHERE
	name = 'Jinzhou'
	AND countrycode = 'CHN'
	AND district = 'Liaoning';

CREATE UNIQUE INDEX "unique_name_countrycode_district" ON city (name, countrycode, district);

CREATE INDEX "index_district" ON city (district);