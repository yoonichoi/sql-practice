-- 2095. Three Purchases
-- Level: Medium

-- List the IDs of customers who made at least 3 orders in both 2020 and 2021.

-- amazon_orders
-- id: int
-- user_id: varchar
-- order_date: datetime
-- order_total: float

with a as (select user_id, count(id) cnt from amazon_orders
where date_format(order_date, '%Y') = '2020'
group by 1
having cnt >= 3),
    b as (select user_id, count(id) cnt from amazon_orders
where date_format(order_date, '%Y') = '2021'
group by 1
having cnt >= 3)

select a.user_id from a join b on a.user_id = b.user_id

