

-- percentage: 5
create or REPLACE PROCEDURE controlled_raise ( percentage NUMERIC ) AS
$$
DECLARE
	real_percentage NUMERIC(8,2);
	total_employees int;

BEGIN
	real_percentage = percentage / 100; --5% = 0.05;
	
	-- Mantener el historico
	insert into raise_history( date, employee_id, base_salary, amount, percentage )
	select 
		CURRENT_DATE as "date",
		employee_id,
		salary,
		max_raise( employee_id ) * real_percentage as amount,
		percentage
	from employees;

	-- Impactar la tabla de empleados
	update employees
		set salary = (max_raise( employee_id ) * real_percentage) + salary;

	COMMIT;

	select count(*) into total_employees from employees;

	raise notice 'Afectados % empleados', total_employees;

END;
$$ LANGUAGE plpgsql;



CALL controlled_raise(1);

select * from employees;
select * from raise_history;

select 24000.00 * 0.01, max_raise(100);



select 
	CURRENT_DATE as "date",
	employee_id,
	salary,
	max_raise( employee_id ) * 0.05 as amount,
	5 as percentage
from employees;

