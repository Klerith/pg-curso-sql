select count(*) from "user" 
	where username='fernando' and 
	password = crypt('123456', password);


create or REPLACE PROCEDURE user_login( user_name VARCHAR, user_password varchar )
as $$
DECLARE 
	was_found BOOLEAN;


BEGIN
	select count(*) into was_found from "user" 
		where username = user_name and 
		password = crypt( user_password , password);

	if ( was_found = false ) THEN
		insert into session_failed(username, "when") VALUES( user_name, now());
		COMMIT;
		raise EXCEPTION 'Usuario y contraseña no son correctos';	
	end IF;
	
		
	update "user" set last_login = now() where username = user_name;
	COMMIT;
	raise notice 'Usuario encontrado %', was_found;
	
END;
$$ LANGUAGE plpgsql;

CALL user_login( 'fernando','123456 ' );







