


select 
	employee_id, 
	first_name, 
	salary, 
	max_salary,
	max_salary - salary as possible_raise,
	max_raise( employee_id )
from employees
INNER JOIN jobs on jobs.job_id = employees.job_id;


select max_raise(206);


select employee_id, first_name, max_raise(employee_id) from employees;




CREATE OR REPLACE FUNCTION max_raise( empl_id int )
returns NUMERIC(8,2) as $$

DECLARE
	-- salary NUMERIC(8,2);
	-- max_salary NUMERIC(8,2);
	possible_raise NUMERIC(8,2);

BEGIN
	
	select 
		max_salary - salary into possible_raise
	from employees
	INNER JOIN jobs on jobs.job_id = employees.job_id
	WHERE employee_id = empl_id;

	return possible_raise;

END;
$$ LANGUAGE plpgsql;








