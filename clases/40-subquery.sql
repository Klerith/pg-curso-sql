

SELECT
	*
FROM (
	SELECT
		count(*) as total,
		SUBSTRING(email, POSITION('@' IN email) + 1) AS DOMAIN,
		'Fernando' AS name,
		37 AS age
	FROM
		users
	GROUP BY
		SUBSTRING(email, POSITION('@' IN email) + 1)
	HAVING
		count(*) > 1
	ORDER BY
		SUBSTRING(email, POSITION('@' IN email) + 1) ASC
) as email_domains;



