

SELECT
	count(*),
	SUBSTRING(email, POSITION('@' IN email) + 1) AS DOMAIN
FROM
	users
GROUP BY
	SUBSTRING(email, POSITION('@' IN email) + 1)
HAVING
	count(*) > 1
order by 
	SUBSTRING(email, POSITION('@' IN email) + 1) asc;


