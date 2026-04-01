create database pizza;
  select * from pizza_sales;

                                  -- TOTAL REVENUE
select round(sum(total_price),2) as total_revenue from pizza_sales;
                                 -- AVG ORDER VALUE
SELECT ROUND(SUM(total_price) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM pizza_sales;
                                  -- TOTAL PIZZA SOLD
select sum(quantity) as total_sales from pizza_sales;

                               -- TOTAL ORDERS PLACED
select count(distinct order_id) as total_orders from pizza_sales;

                               -- AVG PIZZA PER ORDER
select sum(quantity)/count(distinct order_id) as avg_pizza_perorder from pizza_sales;
                                 -- DAILY TREND
SELECT DAYNAME(order_date) AS order_day,
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DAYNAME(order_date)
order by COUNT(DISTINCT order_id);
                                     -- HOURLY TREND
SELECT HOUR(order_time) AS order_hours,
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY HOUR(order_time)
ORDER BY order_hours;
                                -- % OF SALES BY PIZZA CATEGORY
SELECT pizza_category,
       ROUND(SUM(total_price) * 100 / 
            (SELECT SUM(total_price) FROM pizza_sales WHERE month(order_date)= 1), 2) AS percentage
FROM pizza_sales
WHERE month(order_date) = 1
GROUP BY pizza_category;

                                  -- %  OF SALES BY PIZZA SIZE
SELECT pizza_size,
ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales
WHERE MONTH(order_date) = 1),2) AS PCT FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_size
ORDER BY PCT DESC;

-- 
SELECT pizza_size,
       ROUND(SUM(total_price) * 100 / 
            (SELECT SUM(total_price) 
             FROM pizza_sales 
             WHERE QUARTER(order_date) = 1), 2) AS PCT
FROM pizza_sales
WHERE QUARTER(order_date) = 1
GROUP BY pizza_size
ORDER BY PCT DESC;
                               -- TOTAL PIZZA SOLD BY PIZZA CATEGORY
select pizza_category,sum(quantity) as Total_pizza_sold
from pizza_sales
group by pizza_category;

                            -- TOP 5 BEST SELLERS BY TOTAL PIZZAS SOLD
select pizza_name,sum(quantity) as total_pizza_solds
from pizza_sales
group by pizza_name
order by sum(quantity) desc
limit 5;
                                   -- BOTTOM 5 
select pizza_name,sum(quantity) as total_pizza_solds
from pizza_sales
group by pizza_name
order by sum(quantity) asc
limit 5;











