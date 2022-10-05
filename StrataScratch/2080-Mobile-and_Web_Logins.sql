-- 2080. Mobile and Web Logins
-- Level: Easy

-- Count the number of unique users per day who logged in from both a mobile device and web. 
-- Output the date and the corresponding number of users.

-- mobile_logs
-- user_id: varchar
-- date: datetime

-- web_logs
-- user_id: varchar
-- date: datetime
select m.date, count(distinct m.user_id)
from mobile_logs m join web_logs w 
on m.user_id=w.user_id and w.date=m.date
group by 1