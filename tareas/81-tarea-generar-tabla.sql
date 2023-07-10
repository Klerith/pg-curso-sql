-- Count Union - Tarea
-- Total |  Continent
-- 5	  | Antarctica
-- 28	  | Oceania
-- 46	  | Europe
-- 51	  | America
-- 51	  | Asia
-- 58	  | Africa

(
	SELECT
		count(*) AS Total,
		b.name
	FROM
		country a
		INNER JOIN continent b ON a.continent = b.code
	WHERE
		b.name NOT LIKE '%America%'
	GROUP BY
		b.name)
UNION (
	SELECT
		count(*) AS total,
		'America'
	FROM
		country a
		INNER JOIN continent b ON a.continent = b.code
	WHERE
		b. "name" LIKE '%America%')
ORDER BY
	total ASC;



(
	SELECT
		count(*) AS Total,
		b.name
	FROM
		country a
		INNER JOIN continent b ON a.continent = b.code
	WHERE
		b.code NOT in(4, 6, 8)
	GROUP BY
		b.name)
UNION (
	SELECT
		count(*) AS total,
		'America'
	FROM
		country a
		INNER JOIN continent b ON a.continent = b.code
	WHERE
		b.code in(4, 6, 8))
ORDER BY
	total ASC;