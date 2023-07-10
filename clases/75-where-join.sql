

SELECT
	a.name AS country,
	b.name AS continent
FROM
	country a,
	continent b
WHERE
	a.continent = b.code
ORDER BY
	a.name ASC;

