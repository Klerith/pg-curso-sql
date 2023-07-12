
DROP SEQUENCE user_sequence;

CREATE SEQUENCE user_sequence;


select currval('user_sequence'), nextval('user_sequence'), currval('user_sequence');

Create TABLE users6 (
	"user_id" INTEGER PRIMARY KEY default nextval('user_sequence'),
	"username" VARCHAR
);
