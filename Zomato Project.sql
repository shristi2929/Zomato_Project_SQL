USE zomato_db;
select * from customers;
select * from restaurants;
select * from riders;
select * from orders;
select * from deliveries;
--   BASIC BUSINESS PROBLEM

-- Find the total number of orders each restaurant has received.
SELECT RESTAURANT_ID ,COUNT(*) AS TOTAL_ORDERS
FROM ORDERS
GROUP BY RESTAURANT_ID;




-- Calculate the average amount spent by each customer.
SELECT  CUSTOMER_ID,AVG(TOTAL_AMOUNT) AS AVERAGE_AMOUNT
FROM ORDERS
GROUP BY CUSTOMER_ID;


-- Find the total sales amount for each restaurant.
SELECT RESTAURANT_ID, SUM(TOTAL_AMOUNT) AS SALES_AMOUNT
FROM ORDERS
GROUP BY RESTAURANT_ID; 

-- Identify the order with the highest number of items.

SELECT order_id, COUNT(order_item) AS num_items
FROM orders
GROUP BY order_id
ORDER BY num_items DESC
LIMIT 1;

-- Find the top 5 customers who have placed the most orders.


SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
LIMIT 5;

-- Retrieve orders placed in the last 30 days.


SELECT *
FROM orders
WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);


-- Calculate the average delivery time for each rider.

SELECT RIDER_ID, AVG (DELIVERY_TIME) AS TIME
FROM DELIVERIES
GROUP BY RIDER_ID;


SELECT rider_id, 
       SEC_TO_TIME(AVG(TIME_TO_SEC(delivery_time))) AS average_delivery_time
FROM deliveries
GROUP BY rider_id;

-- List restaurants that are open 24 hours.

SELECT restaurant_id, restaurant_name, opening_hours
FROM restaurants
WHERE opening_hours LIKE '%24:00%' OR opening_hours LIKE '%12:00 AM%';

--  Get the count of each order status.

-- 10. Find out how many deliveries each rider has completed.


SELECT rider_id, COUNT(delivery_id) AS completed_deliveries
FROM deliveries
WHERE delivery_status = 'Delivered'
GROUP BY rider_id;

-- 11. Identify the top 5 restaurants with the highest total sales.



SELECT 
    r.restaurant_name, 
	SUM(o.total_amount) AS total_sales
FROM 
    Restaurants r
JOIN 
    Orders o
ON 
    r.restaurant_id = o.restaurant_id
GROUP BY 
    r.restaurant_id
ORDER BY 
    total_sales DESC
LIMIT 5;

-- 12. Get the number of orders per city.
SELECT R.CITY, COUNT(O.ORDER_ID) AS NUMBER_OF_ORDER
FROM RESTAURANTS R 
INNER JOIN ORDERS O 
ON R.RESTAURANT_ID = O.RESTAURANT_ID
GROUP BY R.CITY
ORDER BY  NUMBER_OF_ORDER


-- 13. Find the most frequently ordered item.
SELECT 
    order_item,
    COUNT(order_id) AS order_count
FROM 
    Orders
GROUP BY 
    order_item
ORDER BY 
    order_count DESC
LIMIT 1;

-- 14. List orders where the delivery was completed on time


SELECT 
    o.ORDER_ID,
    d.DELIVERY_STATUS,
    o.ORDER_TIME,
    d.DELIVERY_TIME
FROM 
    ORDERS o
JOIN 
    DELIVERIES d
ON 
    o.ORDER_ID = d.ORDER_ID
WHERE 
    d.DELIVERY_STATUS = 'DELIVERED'
    AND d.DELIVERY_TIME >= o.ORDER_TIME;


-- 15. Calculate the average order amount for each day of the week.


-- 16. List customers who have placed orders in the last 90 days.

SELECT 
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date
FROM 
    Customers c
JOIN 
    Orders o 
ON 
    c.customer_id = o.customer_id
WHERE 
    o.order_date >= DATE_SUB(CURDATE(), INTERVAL 90 DAY);
    
-- 17. Get delivery times and statuses for completed deliveries

SELECT 
    delivery_id,
    order_id,
    delivery_time,
    delivery_status
FROM 
    Deliveries
WHERE 
    delivery_status = 'Completed';
    
    
-- 18.. Find restaurants that have not received any orders.
SELECT R.RESTAURANT_NAME, R.RESTAURANT_ID  --
FROM RESTAURANTS R 
LEFT JOIN ORDERS O 
ON R.RESTAURANT_ID= O.RESTAURANT_ID
WHERE O.ORDER_ID IS NULL;

-- 19. Calculate the total number of orders for each month.
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    COUNT(order_id) AS total_orders
FROM 
    Orders
GROUP BY 
    YEAR(order_date), MONTH(order_date)
ORDER BY 
    year DESC, month DESC;
    
-- 20.Find the order with the longest time from order placement to delivery
SELECT 
    o.order_id,
    o.customer_id,
    o.restaurant_id,
    o.order_item,
    o.order_date,
    o.order_time,
    d.delivery_time,
    TIMESTAMPDIFF(SECOND, CONCAT(o.order_date, ' ', o.order_time), d.delivery_time) AS time_diff_seconds
FROM 
    Orders o
JOIN 
    Deliveries d 
ON 
    o.order_id = d.order_id
ORDER BY 
    time_diff_seconds DESC
LIMIT 1;

-- INTERMEDIATE QUESTION --
-- 1. Identify the city with the highest average order amount.
SELECT r.city, AVG(o.total_amount) AS avg_order_amount
FROM Orders o
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.city
ORDER BY avg_order_amount DESC
LIMIT 1;


-- Conclusion:  Delhi  city is the highest average order amount may indicate higher-income customers or specific food preferences. Focus on expanding services in these regions.

-- 2. Find the restaurant with the highest number of customers placing orders.
SELECT r.restaurant_name, COUNT(DISTINCT o.customer_id) AS unique_customers
FROM Orders o
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
ORDER BY unique_customers DESC
LIMIT 1;
 -- Conclusion: The restaurant attracting the most customers should be studied for successful business practices that could be applied to other locations.

-- 4. Which rider has the highest delivery success rate?

SELECT r.rider_name, 
    (COUNT(CASE WHEN d.delivery_status = 'Completed' THEN 1 END) * 100.0) / COUNT(*) AS success_rate
FROM deliveries d
JOIN riders r ON d.rider_id = r.rider_id
GROUP BY r.rider_name
ORDER BY success_rate DESC
LIMIT 1;

-- Conclusion: Identify riders with the highest success rates to understand what contributes to their efficiency, and use their methods to train others.

-- 5. List the top 5 restaurants with the highest number of deliveries.
SELECT r.restaurant_name, COUNT(d.delivery_id) AS delivery_count
FROM deliveries d
JOIN Orders o ON d.order_id = o.order_id
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
ORDER BY delivery_count DESC
LIMIT 5;

-- Conclusion: Top restaurants with high delivery counts are likely to be popular. They may benefit from additional support, such as increased staff or enhanced marketing efforts.

-- 9. Find customers who have never ordered more than one item in a single order.
SELECT c.customer_name, COUNT(o.order_item) AS item_count
FROM Orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_item) = 1;
-- Conclusion: Understanding customers who consistently order one item could help tailor promotions to encourage more items per order.

-- 10. Which restaurant has the most delayed orders (based on delivery time vs order time)?
SELECT r.restaurant_name, COUNT(o.order_id) AS delayed_orders
FROM Orders o
JOIN deliveries d ON o.order_id = d.order_id
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
WHERE EXTRACT(EPOCH FROM d.delivery_time - o.order_time)/60 > 30
GROUP BY r.restaurant_name
ORDER BY delayed_orders DESC
LIMIT 1;
-- Conclusion: Restaurants with frequent delays should review their delivery processes or communicate better with customers to manage expectations.

-- 11. Identify the top 3 cities with the most orders placed.
SELECT r.city, COUNT(o.order_id) AS order_count
FROM Orders o
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.city
ORDER BY order_count DESC
LIMIT 3;
-- Conclusion: Focus on high-performing cities for marketing and potential expansion while identifying opportunities to grow in underperforming cities.

-- 12. Which order items are most frequently ordered together?
SELECT order_item, COUNT(*) AS item_count
FROM Orders
GROUP BY order_item
ORDER BY item_count DESC
LIMIT 5;
-- Conclusion: Use data on frequently ordered items to create combo meals or promotions that can increase sales.

-- 13.Calculate the average number of items per order for each restaurant.

SELECT r.restaurant_name, AVG(item_count) AS avg_items_per_order
FROM (
    SELECT order_id, restaurant_id, COUNT(DISTINCT order_item) AS item_count
    FROM Orders
    GROUP BY order_id, restaurant_id
) AS order_items
JOIN restaurants r ON order_items.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name;
-- Conclusion: Restaurants with a low average number of items per order could benefit from bundling strategies or offering special deals on multiple items.

-- 15. Find the most popular delivery times for each restaurant.

SELECT r.restaurant_name, EXTRACT(HOUR FROM d.delivery_time) AS delivery_hour, COUNT(*) AS order_count
FROM deliveries d
JOIN Orders o ON d.order_id = o.order_id
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name, delivery_hour
ORDER BY order_count DESC;
-- Conclusion: Knowing the busiest delivery hours helps optimize staffing and ensure timely deliveries

-- 16. Identify restaurants with orders canceled due to 'out of stock' issues.
SELECT r.restaurant_name, COUNT(o.order_id) AS canceled_orders
FROM Orders o
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
WHERE o.order_status = 'Canceled' AND o.order_item LIKE '%out of stock%'
GROUP BY r.restaurant_name
ORDER BY canceled_orders DESC;
-- Conclusion: Regular stockouts could indicate poor inventory management. Ensure timely stock replenishment or communicate stock availability more clearly to customers.

-- 17. Find the top 5 riders who have delivered orders the fastest (based on delivery time).

SELECT r.rider_name, 
       AVG(TIMESTAMPDIFF(MINUTE, o.order_time, d.delivery_time)) AS avg_delivery_time
FROM deliveries d
JOIN riders r ON d.rider_id = r.rider_id
JOIN Orders o ON d.order_id = o.order_id
GROUP BY r.rider_name
ORDER BY avg_delivery_time ASC
LIMIT 5;

-- Conclusion: Fast riders should be rewarded or studied for their methods to improve overall delivery efficiency.

-- 18. Identify the cities with the lowest number of orders in the last month.

SELECT r.city, COUNT(o.order_id) AS order_count
FROM Orders o
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
WHERE EXTRACT(MONTH FROM o.order_date) = EXTRACT(MONTH FROM CURRENT_DATE) - 1
GROUP BY r.city
ORDER BY order_count ASC;
-- Conclusion: Focus marketing efforts or introduce promotions to boost orders in these underperforming cities.

-- Find the restaurants with the lowest total sales for the past 3 months.

SELECT r.restaurant_name, SUM(o.total_amount) AS total_sales
FROM Orders o
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
WHERE o.order_date > DATE_SUB(CURRENT_DATE, INTERVAL 3 MONTH)
GROUP BY r.restaurant_name
ORDER BY total_sales ASC;

-- Conclusion: Underperforming restaurants may need support in terms of marketing or customer experience improvements.

-- Calculate the percentage of on-time deliveries for each restaurant.

SELECT r.restaurant_name, 
       (SUM(CASE WHEN d.delivery_status = 'Completed' AND TIMESTAMPDIFF(MINUTE, o.order_time, d.delivery_time) <= 30 THEN 1 ELSE 0 END) * 100.0) / COUNT(d.delivery_id) AS on_time_percentage
FROM deliveries d
JOIN Orders o ON d.order_id = o.order_id
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name;

-- Conclusion: If certain restaurants have low on-time delivery rates, consider streamlining processes or adjusting operational workflows to improve performance.

-- ADVANCED BUSINESS QUESTION
USE zomato_db;
-- Q.1
-- Write a query to find the top 5 most frequently ordered dishes by customer called "Arjun Mehta" in the last 1 year.
-- 

-- 2. Popular Time Slots
-- Question: Identify the time slots during which the most orders are placed. based on 2-hour intervals.

SELECT 
    CASE
        WHEN EXTRACT(HOUR FROM order_time) BETWEEN 0 AND 1 THEN '00:00 - 02:00'
        WHEN EXTRACT(HOUR FROM order_time) BETWEEN 2 AND 3 THEN '02:00 - 04:00'
        WHEN EXTRACT(HOUR FROM order_time) BETWEEN 4 AND 5 THEN '04:00 - 06:00'
        WHEN EXTRACT(HOUR FROM order_time) BETWEEN 6 AND 7 THEN '06:00 - 08:00'
        WHEN EXTRACT(HOUR FROM order_time) BETWEEN 8 AND 9 THEN '08:00 - 10:00'
        WHEN EXTRACT(HOUR FROM order_time) BETWEEN 10 AND 11 THEN '10:00 - 12:00'
        WHEN EXTRACT(HOUR FROM order_time) BETWEEN 12 AND 13 THEN '12:00 - 14:00'
        WHEN EXTRACT(HOUR FROM order_time) BETWEEN 14 AND 15 THEN '14:00 - 16:00'
        WHEN EXTRACT(HOUR FROM order_time) BETWEEN 16 AND 17 THEN '16:00 - 18:00'
        WHEN EXTRACT(HOUR FROM order_time) BETWEEN 18 AND 19 THEN '18:00 - 20:00'
        WHEN EXTRACT(HOUR FROM order_time) BETWEEN 20 AND 21 THEN '20:00 - 22:00'
        WHEN EXTRACT(HOUR FROM order_time) BETWEEN 22 AND 23 THEN '22:00 - 00:00'
    END AS time_slot,
    COUNT(order_id) AS order_count
FROM Orders
GROUP BY time_slot, CUSTOMER_ID
ORDER BY order_count DESC;


-- 3. Order Value Analysis
-- Question: Find the average order value per customer who has placed more than 750 orders.
-- Return customer_name, and aov(average order value)


SELECT 
	-- o.customer_id,
	c.customer_name,
	AVG(o.total_amount) as aov
FROM orders as o
	JOIN customers as c
	ON c.customer_id = o.customer_id
GROUP BY 1
HAVING  COUNT(order_id) > 750

-- 4. High-Value Customers
-- Question: List the customers who have spent more than 100K in total on food orders.
-- return customer_name, and customer_id!


SELECT 
	-- o.customer_id,
	c.customer_name,
	SUM(o.total_amount) as total_spent
FROM orders as o
	JOIN customers as c
	ON c.customer_id = o.customer_id
GROUP BY 1
HAVING SUM(o.total_amount) > 100000

-- 5. Orders Without Delivery
-- Question: Write a query to find orders that were placed but not delivered. 
-- Return each restuarant name, city and number of not delivered orders 

SELECT 
	r.restaurant_name,
	COUNT(o.order_id) as cnt_not_delivered_orders
FROM orders as o
LEFT JOIN 
restaurants as r
ON r.restaurant_id = o.restaurant_id
LEFT JOIN
deliveries as d
ON d.order_id = o.order_id
WHERE d.delivery_id IS NULL
GROUP BY 1
ORDER BY 2 DESC


SELECT 
	r.restaurant_name,
	COUNT(*)
FROM orders as o
LEFT JOIN 
restaurants as r
ON r.restaurant_id = o.restaurant_id
WHERE 
	o.order_id NOT IN (SELECT order_id FROM deliveries)
GROUP BY 1
ORDER BY 2 DESC

-- Q. 6
-- Restaurant Revenue Ranking: 
-- Rank restaurants by their total revenue from the last year, including their name, 
-- total revenue, and rank within their city.

WITH RestaurantRevenue AS (
    SELECT
        r.restaurant_id,
        r.restaurant_name,
        r.city,
        SUM(o.total_amount) AS total_revenue
    FROM
        restaurants r
    JOIN
        orders o ON r.restaurant_id = o.restaurant_id
    WHERE
        o.order_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) -- Filter orders from the last year
    GROUP BY
        r.restaurant_id, r.restaurant_name, r.city
),
RankedRevenue AS (
    SELECT
        rr.restaurant_id,
        rr.restaurant_name,
        rr.city,
        rr.total_revenue,
        RANK() OVER (PARTITION BY rr.city ORDER BY rr.total_revenue DESC) AS city_rank
    FROM
        RestaurantRevenue rr
)
SELECT
    rr.restaurant_name,
    rr.total_revenue,
    rr.city_rank
FROM
    RankedRevenue rr
ORDER BY
    rr.city_rank ASC;
    
-- Q. 7
-- Most Popular Dish by City: 
-- Identify the most popular dish in each city based on the number of orders.

SELECT * 
FROM
(SELECT 
	r.city,
	o.order_item as dish,
	COUNT(order_id) as total_orders,
	RANK() OVER(PARTITION BY r.city ORDER BY COUNT(order_id) DESC) as DISH_rank
FROM orders as o
JOIN 
restaurants as r
ON r.restaurant_id = o.restaurant_id
GROUP BY 1, 2
) as t1
WHERE DISH_rank = 1;

WITH DishOrders AS (
    SELECT 
        r.city,
        o.order_item AS dish,
        COUNT(o.order_id) AS dish_count
    FROM 
        restaurants r
    JOIN 
        orders o ON r.restaurant_id = o.restaurant_id
    GROUP BY 
        r.city, o.order_item
), 
RankedDishOrders AS (
    SELECT 
        city,
        dish,
        dish_count,
        RANK() OVER (PARTITION BY city ORDER BY dish_count DESC) AS dish_rank
    FROM 
        DishOrders
)
SELECT 
    city, 
    dish, 
    dish_count
FROM 
    RankedDishOrders
WHERE 
    dish_rank = 1;
    
-- Q.8 Customer Churn: 
-- Find customers who havenâ€™t placed an order in 2024 but did in 2023.

-- find cx who has done orders in 2023
-- find cx who has not done orders in 2024
-- compare 1 and 2

SELECT DISTINCT customer_id FROM orders
WHERE 
	EXTRACT(YEAR FROM order_date) = 2023
	AND
	customer_id NOT IN 
					(SELECT DISTINCT customer_id FROM orders
					WHERE EXTRACT(YEAR FROM order_date) = 2024);

SELECT c.customer_id
FROM customers c
WHERE c.customer_id IN (
  SELECT DISTINCT o.customer_id
  FROM orders o
  WHERE o.order_date BETWEEN '2023-01-01' AND '2023-12-31'
)
AND c.customer_id NOT IN (
  SELECT DISTINCT o.customer_id
  FROM orders o
  WHERE o.order_date BETWEEN '2024-01-01' AND '2024-12-31'
);

-- Q.9 Cancellation Rate Comparison: ????
-- Calculate and compare the order cancellation rate for each restaurant between the 
-- current year and the previous year.
WITH cancel_ratio_23 AS (
    SELECT 
        o.restaurant_id,
        COUNT(o.order_id) AS total_orders,
        COUNT(CASE WHEN d.delivery_id IS NULL THEN 1 END) AS not_delivered
    FROM orders AS o
    LEFT JOIN deliveries AS d
    ON o.order_id = d.order_id
    WHERE EXTRACT(YEAR FROM o.order_date) = 2023
    GROUP BY o.restaurant_id
),
cancel_ratio_24 AS (
    SELECT 
        o.restaurant_id,
        COUNT(o.order_id) AS total_orders,
        COUNT(CASE WHEN d.delivery_id IS NULL THEN 1 END) AS not_delivered
    FROM orders AS o
    LEFT JOIN deliveries AS d
    ON o.order_id = d.order_id
    WHERE EXTRACT(YEAR FROM o.order_date) = 2024
    GROUP BY o.restaurant_id
),
last_year_data AS (
    SELECT 
        restaurant_id,
        total_orders,
        not_delivered,
        ROUND((not_delivered::numeric / total_orders::numeric) * 100, 2) AS cancel_ratio
    FROM cancel_ratio_23
),
current_year_data AS (
    SELECT 
        restaurant_id,
        total_orders,
        not_delivered,
        ROUND((not_delivered::numeric / total_orders::numeric) * 100, 2) AS cancel_ratio
    FROM cancel_ratio_24
)	

SELECT 
    c.restaurant_id AS restaurant_id,
    c.cancel_ratio AS current_year_cancel_ratio,
    l.cancel_ratio AS last_year_cancel_ratio
FROM current_year_data AS c
JOIN last_year_data AS l
ON c.restaurant_id = l.restaurant_id;


-- Q.10 Rider Average Delivery Time: ????
-- Determine each rider's average delivery time.

SELECT 
    o.order_id,
    o.order_time,
    d.delivery_time,
    d.rider_id,
    d.delivery_time - o.order_time AS time_difference,
	EXTRACT(EPOCH FROM (d.delivery_time - o.order_time + 
	CASE WHEN d.delivery_time < o.order_time THEN INTERVAL '1 day' ELSE
	INTERVAL '0 day' END))/60 as time_difference_insec
FROM orders AS o
JOIN deliveries AS d
ON o.order_id = d.order_id
WHERE d.delivery_status = 'Delivered';

-- Q.11 Monthly Restaurant Growth Ratio: ???
-- Calculate each restaurant's growth ratio based on the total number of delivered orders since its joining

WITH growth_ratio
AS
(
SELECT 
	o.restaurant_id,
	EXTRACT(YEAR FROM o.order_date) as year,
	EXTRACT(MONTH FROM o.order_date) as month,
	COUNT(o.order_id) as cr_month_orders,
	LAG(COUNT(o.order_id), 1) OVER(PARTITION BY o.restaurant_id ORDER BY EXTRACT(YEAR FROM o.order_date),
    EXTRACT(MONTH FROM o.order_date)) as prev_month_orders
FROM orders as o
JOIN
deliveries as d
ON o.order_id = d.order_id
WHERE d.delivery_status = 'Delivered'
GROUP BY 1, 2, 3
ORDER BY 1, 2
)
SELECT
	restaurant_id,
	month,
	prev_month_orders,
	cr_month_orders,
	ROUND(
	(cr_month_orders::numeric-prev_month_orders::numeric)/prev_month_orders::numeric * 100
	,2)
	as growth_ratio
FROM growth_ratio;

-- Q.12 Customer Segmentation: 
-- Customer Segmentation: Segment customers into 'Gold' or 'Silver' groups based on their total spending 
-- compared to the average order value (AOV). If a customer's total spending exceeds the AOV, 
-- label them as 'Gold'; otherwise, label them as 'Silver'. Write an SQL query to determine each segment's 
-- total number of orders and total revenue

-- cx total spend
-- aov
-- gold
-- silver
-- each category and total orders and total rev
-- Calculate total spending for each customer
-- Calculate total spending for each customer
WITH CustomerSpending AS (
    SELECT 
        customer_id,
        SUM(total_amount) AS total_spending  -- Replace total_amount with the actual column name if different
    FROM 
        orders
    GROUP BY 
        customer_id
),
AverageOrderValue AS (
    SELECT 
        AVG(total_amount) AS aov  -- Replace total_amount with the actual column name if different
    FROM 
        orders
),
CustomerSegments AS (
    SELECT 
        cs.customer_id,
        cs.total_spending,
        CASE 
            WHEN cs.total_spending > aov.aov THEN 'Gold'
            ELSE 'Silver'
        END AS segment
    FROM 
        CustomerSpending cs
    CROSS JOIN 
        AverageOrderValue aov
)
SELECT 
    cs.segment,  -- Specify cs.segment to avoid ambiguity
    COUNT(DISTINCT cs.customer_id) AS total_customers,  -- Specify cs.customer_id
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_revenue  -- Replace total_amount with the actual column name if different
FROM 
    CustomerSegments cs
LEFT JOIN 
    orders o ON cs.customer_id = o.customer_id
GROUP BY 
    cs.segment;  -- Specify cs.segment to avoid ambiguity;
 
  
-- Q.13 Rider Monthly Earnings: 
-- Calculate each rider's total monthly earnings, assuming they earn 8% of the order amount.


WITH monthly_earnings AS (
    SELECT
        d.rider_id,
        EXTRACT(YEAR FROM o.order_date) AS year,
        EXTRACT(MONTH FROM o.order_date) AS month,
        SUM(o.total_amount * 0.08) AS total_earnings
    FROM orders AS o
    JOIN deliveries AS d
    ON o.order_id = d.order_id
    WHERE d.delivery_status = 'Delivered'
    GROUP BY d.rider_id, EXTRACT(YEAR FROM o.order_date), EXTRACT(MONTH FROM o.order_date)
)
SELECT
    rider_id,
    year,
    month,
    ROUND(total_earnings, 2) AS total_monthly_earnings
FROM monthly_earnings
ORDER BY rider_id, year, month;


-- Q.14 Rider Ratings Analysis: 
-- Find the number of 5-star, 4-star, and 3-star ratings each rider has.
-- riders receive this rating based on delivery time.
-- If orders are delivered less than 15 minutes of order received time the rider get 5 star rating,
-- if they deliver 15 and 20 minute they get 4 star rating 
-- if they deliver after 20 minute they get 3 star rating.

SELECT 
    rider_id,
    stars,
    COUNT(*) AS total_stars
FROM
(
    SELECT
        rider_id,
        delivery_took_time,
        CASE 
            WHEN delivery_took_time < 15 THEN '5 star'
            WHEN delivery_took_time BETWEEN 15 AND 20 THEN '4 star'
            ELSE '3 star'
        END AS stars
    FROM
    (
        SELECT 
            o.order_id,
            o.order_time,
            d.delivery_time,
            TIMESTAMPDIFF(MINUTE, o.order_time, d.delivery_time) AS delivery_took_time,
            d.rider_id
        FROM orders AS o
        JOIN deliveries AS d ON o.order_id = d.order_id
        WHERE d.delivery_status = 'Delivered'
    ) AS t1
) AS t2
GROUP BY rider_id, stars
ORDER BY rider_id, total_stars DESC;


-- Q.15 Order Frequency by Day: 
-- Analyze order frequency per day of the week and identify the peak day for each restaurant.

SELECT *
FROM
(
    SELECT 
        r.restaurant_name,
        DATE_FORMAT(o.order_date, '%W') AS day,  -- Format the date to get the day name
        COUNT(o.order_id) AS total_orders
    FROM orders AS o
    JOIN restaurants AS r ON o.restaurant_id = r.restaurant_id
    GROUP BY r.restaurant_name, day
) AS t1
WHERE total_orders = (
    SELECT MAX(total_orders)
    FROM (
        SELECT 
            COUNT(o.order_id) AS total_orders
        FROM orders AS o
        JOIN restaurants AS r ON o.restaurant_id = r.restaurant_id
        GROUP BY r.restaurant_name, DATE_FORMAT(o.order_date, '%W')
    ) AS t2
)
ORDER BY restaurant_name;


-- Q.16 Customer Lifetime Value (CLV): 
-- Calculate the total revenue generated by each customer over all their orders.

SELECT 
	o.customer_id,
	c.customer_name,
	SUM(o.total_amount) as CLV
FROM orders as o
JOIN customers as c
ON o.customer_id = c.customer_id
GROUP BY 1, 2



-- Q.17 Monthly Sales Trends: 
-- Identify sales trends by comparing each month's total sales to the previous month.

SELECT 
	EXTRACT(YEAR FROM order_date) as year,
	EXTRACT(MONTH FROM order_date) as month,
	SUM(total_amount) as total_sale,
	LAG(SUM(total_amount), 1) OVER(ORDER BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)) as prev_month_sale
FROM orders
GROUP BY 1, 2

-- Q.18 Rider Efficiency: 
-- Evaluate rider efficiency by determining average delivery times and identifying those with the lowest and highest averages.



SELECT 
    MIN(avg_time) AS min_avg_time,
    MAX(avg_time) AS max_avg_time
FROM
(
    SELECT 
        d.rider_id AS riders_id,
        AVG(TIMESTAMPDIFF(MINUTE, o.order_time, d.delivery_time)) AS avg_time
    FROM orders AS o
    JOIN deliveries AS d ON o.order_id = d.order_id
    WHERE d.delivery_status = 'Delivered'
    GROUP BY d.rider_id
) AS riders_time;


SELECT 
    MIN(avg_time) AS min_avg_time,
    MAX(avg_time) AS max_avg_time
FROM
(
    SELECT 
        d.rider_id AS riders_id,
        AVG(TIMESTAMPDIFF(MINUTE, o.order_time, d.delivery_time)) AS avg_time
    FROM orders AS o
    JOIN deliveries AS d ON o.order_id = d.order_id
    WHERE d.delivery_status = 'Delivered'
    GROUP BY d.rider_id
) AS riders_time;

WITH riders_time AS (
    SELECT 
        d.rider_id AS riders_id,
        AVG(TIMESTAMPDIFF(MINUTE, o.order_time, d.delivery_time)) AS avg_time
    FROM orders AS o
    JOIN deliveries AS d ON o.order_id = d.order_id
    WHERE d.delivery_status = 'Delivered'
    GROUP BY d.rider_id
)

SELECT 
    MIN(avg_time) AS min_avg_time,
    MAX(avg_time) AS max_avg_time
FROM riders_time;


-- Q.19 Order Item Popularity: 
-- Track the popularity of specific order items over time and identify seasonal demand spikes.

SELECT 
	order_item,
	seasons,
	COUNT(order_id) as total_orders
FROM 
(
SELECT 
		*,
		EXTRACT(MONTH FROM order_date) as month,
		CASE 
			WHEN EXTRACT(MONTH FROM order_date) BETWEEN 4 AND 6 THEN 'Spring'
			WHEN EXTRACT(MONTH FROM order_date) > 6 AND 
			EXTRACT(MONTH FROM order_date) < 9 THEN 'Summer'
			ELSE 'Winter'
		END as seasons
	FROM orders
) as t1
GROUP BY 1, 2
ORDER BY 1, 3 DESC


WITH order_seasons AS (
    SELECT 
        order_item,
        order_id,  -- Include order_id here
        order_date,
        CASE 
            WHEN MONTH(order_date) BETWEEN 4 AND 6 THEN 'Spring'
            WHEN MONTH(order_date) > 6 AND MONTH(order_date) < 9 THEN 'Summer'
            ELSE 'Winter'
        END AS seasons
    FROM orders
)

SELECT 
    order_item,
    seasons,
    COUNT(order_id) AS total_orders
FROM order_seasons
GROUP BY order_item, seasons
ORDER BY order_item, total_orders DESC;


SELECT 
    order_item,
    CASE 
        WHEN MONTH(order_date) BETWEEN 4 AND 6 THEN 'Spring'
        WHEN MONTH(order_date) > 6 AND MONTH(order_date) < 9 THEN 'Summer'
        ELSE 'Winter'
    END AS seasons,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_item, seasons
ORDER BY order_item, total_orders DESC;

-- Q.20 Rank each city based on the total revenue for last year 2023 

SELECT 
	r.city,
	SUM(total_amount) as total_revenue,
	RANK() OVER(ORDER BY SUM(total_amount) DESC) as city_rank
FROM orders as o
JOIN
restaurants as r
ON o.restaurant_id = r.restaurant_id
GROUP BY 1;

