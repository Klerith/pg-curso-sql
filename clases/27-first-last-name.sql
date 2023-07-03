select * from users;

SELECT
	name,
	-- 	SUBSTRING( name, 0, 5 ),
	-- 	POSITION( ' ' in name ),
	SUBSTRING(name, 0, POSITION(' ' IN name)) AS first_name,
	SUBSTRING(name, POSITION(' ' IN name) + 1) AS last_name
	-- 	TRIM(SUBSTRING( name, POSITION( ' ' in name ) )) as trimmed_last_name
FROM
	users;

UPDATE
	users
SET
	first_name = SUBSTRING(name, 0, POSITION(' ' IN name)),
	last_name = SUBSTRING(name, POSITION(' ' IN name) + 1);

SELECT
	*
FROM
	users;





