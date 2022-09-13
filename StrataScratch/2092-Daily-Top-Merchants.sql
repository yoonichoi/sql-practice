-- 2092. Daily Top Merchants
-- Level: Medium 

-- For each day, find the top 3 merchants with the highest number of orders on that day. In case of a tie, multiple merchants can share the same place but on each day, there should always be at least 1 merchant on the first, second and third place.
-- Output the date, the name of the merchant and their place in the daily ranking.

-- doordash_orders
-- id: int
-- customer_id: int
-- merchant_id: int
-- order_timestamp: datetime
-- n_items: int
-- total_amount_earned: float

-- doordash_merchants
-- id: int
-- name: varchar
-- category: varchar
-- zipcode: int

with cte as (select merchant_id, date_format(order_timestamp, '%Y-%m-%d') date, count(customer_id) cnt from doordash_orders
group by 1,2)

select date, name, rnk from (
select date, merchant_id, dense_rank()over (partition by date order by cnt desc) rnk from cte) a
left join doordash_merchants m on a.merchant_id = m.id
where rnk in (1,2,3)