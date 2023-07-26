
with posts_week_2024 as (
	SELECT date_trunc('week'::text, posts.created_at) AS weeks,
    sum(claps.counter) AS total_claps,
    count(DISTINCT posts.post_id) AS number_of_posts,
    count(*) AS number_of_claps
   FROM posts
     JOIN claps ON claps.post_id = posts.post_id
  GROUP BY (date_trunc('week'::text, posts.created_at))
  ORDER BY (date_trunc('week'::text, posts.created_at)) DESC
)
select * from posts_week_2024
	where weeks BETWEEN '2024-01-01' and '2024-12-31' and total_claps >= 600;
