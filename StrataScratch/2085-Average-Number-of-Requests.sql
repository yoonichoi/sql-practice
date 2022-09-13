-- Average Number of Requests
-- Level: Medium

-- What was the average number of friend requests sent by users in the second week of December 2021?
-- Hint: the second week of December 2021 is the 49th week of the year.

-- fb_requests
-- sender_id: varchar
-- receiver_id: varchar
-- sent_date: datetime
-- is_accepted: bool

with cte as (select sender_id, count(sender_id) cnt from fb_requests
where WEEKOFYEAR(sent_date)=49 and year(sent_date)=2021
group by sender_id)

select avg(cnt) from cte