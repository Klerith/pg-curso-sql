


select 
	employee_id, 
	first_name, 
	salary, 
	max_salary,
	max_salary - salary as possible_raise,
	max_raise( employee_id ),
	max_raise_2( employee_id )
from employees
INNER JOIN jobs on jobs.job_id = employees.job_id;

select * from employees where employee_id = 206;


select max_raise(206);


select employee_id, first_name, max_raise(employee_id) from employees;




CREATE OR REPLACE FUNCTION max_raise_2( empl_id int )
returns NUMERIC(8,2) as $$

DECLARE
	
	selected_employee employees%rowtype;
	selected_job jobs%rowtype;
	
	
	possible_raise NUMERIC(8,2);

BEGIN
	
	-- Tomar el puesto de trabajo y el salario
	select * from employees into selected_employee
	where employee_id = empl_id;

	-- Tomar el max salary, acorde a su job
	select * from jobs into selected_job
	where job_id = selected_employee.job_id;
	
	
	-- Cálculos
	possible_raise = selected_job.max_salary - selected_employee.salary;

	IF ( possible_raise < 0 ) THEN
		RAISE EXCEPTION 'Persona con salario mayor max_salary: id:%, %', selected_employee.employee_id, selected_employee.first_name;
-- 		possible_raise = 0;
	END IF;


	return possible_raise;
	
END;
$$ LANGUAGE plpgsql;



select employee_id, first_name, salary, max_raise_2(employee_id) 
from employees where employee_id = 206;




