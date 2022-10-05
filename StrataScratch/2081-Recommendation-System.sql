-- 2081. Recommendation System
-- Level: Medium

-- You are given the list of Facebook friends and the list of Facebook pages that users follow. 
-- Your task is to create a new recommendation system for Facebook. For each Facebook user, 
-- find pages that this user doesn't follow but at least one of their friends does. 
-- Output the user ID and the ID of the page that should be recommended to this user.

-- user_friends
-- user_id: int
-- friend_id: int

-- user_pages
-- user_id: int
-- page_id: int

select distinct f.user_id, p.page_id from users_friends f
join users_pages p on f.friend_id = p.user_id
where p.page_id not in 
    (select page_id from users_pages where user_id = f.user_id)
