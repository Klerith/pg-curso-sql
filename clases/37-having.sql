SELECT
	count(*) as total,
	country
FROM
	users
GROUP BY
	country
HAVING
	count(*) between 1 and 5
ORDER BY
	count(*) DESC;