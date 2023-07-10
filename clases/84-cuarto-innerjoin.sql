

-- ¿Quiero saber los idiomas oficiales que se hablan por continente?

select * from countrylanguage where isofficial = true;

select * from country;

select * from continent;



select distinct d.name, c."name" as continent from countrylanguage a 
inner JOIN country b ON a.countrycode = b.code
inner join continent c on b.continent = c.code
inner join "language" d on d.code = a.languagecode
where a.isofficial = true;


select * from countrylanguage;

-- ¿Cuantos idiomas oficiales se hablan por continente?
select count(*), continent from (
	select distinct a."language", c."name" as continent from countrylanguage a 
	inner JOIN country b ON a.countrycode = b.code
	inner join continent c on b.continent = c.code
	where a.isofficial = true
) as totales
group by continent;






