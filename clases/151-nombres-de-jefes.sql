

select * from employees;

WITH RECURSIVE bosses as (
	-- Init
		select id, name, reports_to, 1 as depth from employees where id = 1
	UNION
	-- Recursive
	select employees.id, employees.name, employees.repor ts_to, depth + 1 from employees
		INNER JOIN bosses on bosses.id = employees.reports_to
	where DEPTH < 2
)
select bosses.*, employees.name as reports_to_name from bosses
 LEFT JOIN employees on employees.id = bosses.reports_to
 order by depth;


