CALL user_login( 'fernando','123456' );


create or REPLACE TRIGGER create_session_trigger AFTER UPDATE on "user"
FOR EACH ROW 
WHEN (OLD.last_login IS DISTINCT FROM NEW.last_login)
EXECUTE FUNCTION create_session_log();


create or REPLACE FUNCTION create_session_log()
RETURNS TRIGGER as $$

BEGIN
	insert into "session" (user_id, last_login) values ( NEW.id, now() );
	
	return NEW;
END;
$$ LANGUAGE plpgsql;









