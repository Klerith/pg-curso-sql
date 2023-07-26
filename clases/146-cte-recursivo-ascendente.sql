
select 5;


-- nombre de la tabla en memoria
-- campos que vamos a tener
WITH RECURSIVE countdown( val ) as (
  -- initialización => el primer nivel, o valores iniciales	
--   values(5)
	select 10 as val
  UNION
  -- Query recursivo
  select val - 1 from countdown where val > 1
)
-- Select de los campos 
select * from countdown order by val asc;




-- nombre de la tabla en memoria
-- campos que vamos a tener
WITH RECURSIVE counter( val ) as (
  -- initialización => el primer nivel, o valores iniciales	
--   values(5)
	select 1 as val
  UNION
  -- Query recursivo
  select val + 1 from counter where val < 10
)
-- Select de los campos 
select * from counter;




