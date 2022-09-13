-- 2091. Latest Login Date
-- Level: Easy

-- For each video game player, find the latest date when they logged in.

-- player_id: int
-- login_date: datetime

select player_id, max(login_date)
from players_logins
group by 1