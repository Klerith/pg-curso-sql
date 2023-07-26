
WITH claps_per_post as (
	select post_id, sum(counter) from claps
	GROUP by post_id
), posts_from_2023 as (
	select * from posts where created_at BETWEEN '2023-01-01' and '2023-12-31'
)
select * from claps_per_post
	where claps_per_post.post_id in ( select post_id from posts_from_2023 );




