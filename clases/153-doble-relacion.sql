
select followers.*, leader.name as leader, follower.name as follower from followers
INNER join "user" leader on leader.id = followers.leader_id
INNER join "user" follower on follower.id = followers.follower_id;