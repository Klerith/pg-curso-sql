

CREATE EXTENSION pgcrypto;



insert into "user" (username, password)
values( 
	'melissa', 
	crypt( '123456', gen_salt('bf') )
);


select count(*) from "user" 
	where username='fernando' and 
	password = crypt('123456', password);









