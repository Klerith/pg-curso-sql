


SELECT
	max(hire_date),
	-- 	max(hire_date) + INTERVAL '1 days' as days,
	-- 	max(hire_date) + INTERVAL '1 month' as months,
	-- 	max(hire_date) + INTERVAL '1 year' as years,
	max(hire_date) + INTERVAL '1 years' + INTERVAL '1 day' AS years,
	date_part('year', now()),
	MAKE_INTERVAL( YEARS := date_part('year', now())::integer ),
	max(hire_date) + MAKE_INTERVAL( YEARS:= 23)
	
FROM
	employees;

