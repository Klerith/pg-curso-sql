


create or replace PROCEDURE insert_region_proc( int, varchar )
as $$
BEGIN
	insert into regions( region_id, region_name )
	values( $1, $2 );

	raise notice 'Variable 1:  %, %', $1, $2;

-- 	ROLLBACK;
	COMMIT;

END;
$$ LANGUAGE plpgsql;


CALL insert_region_proc(5, 'Central America');

select * from regions;





