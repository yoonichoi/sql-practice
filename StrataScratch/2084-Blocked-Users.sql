-- Blocked Users
-- Level: Medium

-- You are given a table of users who have been blocked from Facebook, together with the date, duration, and the reason for the blocking. The duration is expressed as the number of days after blocking date and if this field is empty, this means that a user is blocked permanently.
-- For each blocking reason, count how many users were blocked in December 2021. Include both the users who were blocked in December 2021 and those who were blocked before but remained blocked for at least a part of December 2021.

-- user_id: int
-- block_reason: varchar
-- block_date: datetime
-- block_duration: float

select block_reason, count(distinct user_id) from fb_blocked_users
where date_format(block_date, '%Y-%m')='2021-12'
    or (block_date < '2021-12-01' and (block_duration is NULL 
        or (datediff('2021-12-01', block_date)<=block_duration)))
group by 1