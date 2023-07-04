


SELECT
	first_name,
	last_name,
	followers
FROM
	users
WHERE
	-- followers >= 4600 AND followers <= 4700
	followers between 4600 and 4700
order by 
	followers asc;


