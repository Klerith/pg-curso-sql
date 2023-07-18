

CREATE OR REPLACE FUNCTION comment_replies( id integer )
RETURNS json
AS
$$
DECLARE result json;

BEGIN
	
	select 
		json_agg( json_build_object(
		  'user', comments.user_id,
		  'comment', comments.content
		)) into result
	from comments where comment_parent_id = id;


	return result;
END;
$$
LANGUAGE plpgsql;



select comment_replies(4);


select 
	a.*,
	comment_replies(a.post_id) as replies
from comments a
where comment_parent_id is null;


