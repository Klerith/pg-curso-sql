


select 
	employee_id, 
	first_name, 
	salary, 
	max_salary,
	max_salary - salary as possible_raise,
	max_raise( employee_id ),
	max_raise_2( employee_id )
from employees
INNER JOIN jobs on jobs.job_id = employees.job_id where employee_id = 206;

select * from employees where employee_id = 206;


select max_raise(206);


select employee_id, first_name, max_raise(employee_id) from employees;




CREATE OR REPLACE FUNCTION max_raise_2( empl_id int )
returns NUMERIC(8,2) as $$

DECLARE
	employee_job_id int;
	current_salary NUMERIC(8,2);

	job_max_salary NUMERIC(8,2);
	possible_raise NUMERIC(8,2);

BEGIN
	
	-- Tomar el puesto de trabajo y el salario
	select 
		job_id, salary
		into employee_job_id, current_salary
	from employees where employee_id = empl_id;

	-- Tomar el max salary, acorde a su job
	select max_salary into job_max_salary from jobs where job_id = employee_job_id;
	
	
	-- Cálculos
	possible_raise = job_max_salary - current_salary;


	return possible_raise;
	
END;
$$ LANGUAGE plpgsql;








