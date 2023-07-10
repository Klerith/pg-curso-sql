-- Quiero que me muestren el país con más ciudades
-- Campos: total de ciudades y el nombre del país
-- usar INNER JOIN

SELECT
	count(*) AS total,
	b.name AS country
FROM
	city a
	INNER JOIN country b ON a.countrycode = b.code
GROUP BY
	b.name
ORDER BY
	count(*)
	DESC
LIMIT 1;