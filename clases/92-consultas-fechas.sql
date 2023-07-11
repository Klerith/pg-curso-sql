SELECT
	*
FROM
	employees
WHERE
	hire_date > date('1998-02-05')
ORDER BY
	hire_date DESC;


SELECT
	max(hire_date) AS mas_nuevo,
	min(hire_date) AS primer_empleado
FROM
	employees;



SELECT
	*
FROM
	employees
WHERE
	hire_date BETWEEN '1999-01-01'
	AND '2001-01-04'
ORDER BY
	hire_date DESC;