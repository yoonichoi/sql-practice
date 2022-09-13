-- 2093. First Time Orders
-- Level: Medium

-- For each merchant, find how many orders and first-time orders they had. First-time orders are meant from the perspective of a customer and are the first order that a customer ever made. In order words, for how many customers was this the first-ever merchant they ordered with?
-- Output the name of the merchant, the total number of their orders and the number of these orders that were first-time orders.

-- doordash_orders
-- id: int
-- customer_id: int
-- merchant_id: int
-- order_timestamp: datetime
-- n_items: int
-- total_amount_earned: float

-- doordash_merchans
-- id: int
-- name: varchar
-- category: varchar
-- zipcode: int


with totord as (
select name, count(customer_id) ordcnt
    from doordash_orders o join doordash_merchants m on o.merchant_id = m.id
    group by 1),
firstord as (
select name, count(customer_id) firstord from
    (select name, customer_id, rank() over (partition by customer_id order by order_timestamp) rnk
    from doordash_orders o join doordash_merchants m on o.merchant_id = m.id)a
    where rnk = 1 group by 1)

select t.name, ordcnt, ifnull(firstord, 0)
from totord t left join firstord f on f.name = t.name