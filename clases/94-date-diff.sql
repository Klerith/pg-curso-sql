

SELECT
	hire_date,
	MAKE_INTERVAL( YEARS := 2023 - EXTRACT( YEARS from hire_date )::integer ) as manual,
	MAKE_INTERVAL( YEARS := date_part('years', CURRENT_DATE)::integer - EXTRACT( YEARS from hire_date )::integer ) as computed
FROM
	employees
order by hire_date desc;



SELECT
	hire_date,
	hire_date + INTERVAL '23 years'		
FROM
	employees
order by hire_date desc;


UPDATE
	employees
SET
	hire_date = hire_date + INTERVAL '23 years';



