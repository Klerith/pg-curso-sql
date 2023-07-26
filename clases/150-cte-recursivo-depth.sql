

select * from employees;

WITH RECURSIVE bosses as (
	-- Init
		select id, name, reports_to, 1 as depth from employees where id = 1
	UNION
	-- Recursive
	select employees.id, employees.name, employees.reports_to, depth + 1 from employees
		INNER JOIN bosses on bosses.id = employees.reports_to
	where DEPTH < 4
)
select * from bosses;

