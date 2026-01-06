/* ---------------------------------------------------------------------------
🍕 The Great Pizza Analytics Challenge
📘 Mini Project under the 21 Days SQL Challenge
🏢 Organized by: Indian Data Club | Sponsored by: DPDzero
--------------------------------------------------------------------------- */

/*
🎯 Objective:
As the data analyst for IDC Pizza, my goal is to transform raw pizza sales data 
into actionable insights using SQL queries.

This challenge covers SQL concepts learned up to Day 15, including:
- Database creation & table design
- Filtering & operators (WHERE, IN, BETWEEN, LIKE, AND/OR/NOT)
- Aggregations (SUM, AVG, COUNT, MIN, MAX, GROUP BY, HAVING)
- Joins (INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN, SELF JOIN)
- Data cleaning (DISTINCT, COALESCE, handling NULLs)
*/

/* ---------------------------------------------------------------------------
🍕 PHASE 1: Foundation & Data Inspection
--------------------------------------------------------------------------- */

/* 1️.List all unique pizza categories */
SELECT DISTINCT(category) AS unique_pizza
FROM pizza_types;

/* 2️.Display pizza_type_id, name, and ingredients, replacing NULL ingredients with “Missing Data”. Show first 5 rows. */
SELECT pizza_type_id, name, COALESCE(ingredients, 'Missing Data') AS ingredients
FROM pizza_types
LIMIT 5;

/* 3️.Check for pizzas missing a price */
SELECT * 
FROM pizzas
WHERE price IS NULL;

/* ---------------------------------------------------------------------------
🍽️ PHASE 2: Filtering & Exploration
--------------------------------------------------------------------------- */

/* 1️. Orders placed on '2015-01-01' */
SELECT order_id, date 
FROM orders 
WHERE date = '2015-01-01';

/* 2️. List pizzas ordered by price descending */
SELECT pizza_id, pizza_type_id, size, price 
FROM pizzas 
ORDER BY price DESC;

/* 3️. Pizzas sold in sizes 'L' or 'XL' */
SELECT pizza_id, pizza_type_id, size 
FROM pizzas 
WHERE size IN ('L', 'XL');

/* 4. Pizzas priced between $15.00 and $17.00 */
SELECT pizza_id, pizza_type_id, size, price 
FROM pizzas 
WHERE price BETWEEN 15.00 AND 17.00;

/* 5️. Pizzas with "Chicken" in the name */
SELECT pizza_type_id, name 
FROM pizza_types 
WHERE name LIKE '%Chicken%';

/* 6️. Orders on '2015-02-15' or placed after 8 PM */
SELECT order_id, date, time 
FROM orders 
WHERE date = '2015-02-15' 
   OR time >= '20:00:00';

/* ---------------------------------------------------------------------------
💵 PHASE 3: Sales Performance & Business Insights
--------------------------------------------------------------------------- */

/* 1️. Total quantity of pizzas sold */
SELECT SUM(quantity) AS pizzas_sold 
FROM order_details;

/* 2️. Average pizza price */
SELECT AVG(price) AS avg_pizza_price 
FROM pizzas;

/* 3️. Total order value per order (JOIN, SUM, GROUP BY) */
SELECT 
    od.order_id, 
    SUM(od.quantity * p.price) AS total_order_value
FROM order_details od
JOIN pizzas p 
    ON p.pizza_id = od.pizza_id
GROUP BY od.order_id;

/* 4️. Total quantity sold per pizza category */
SELECT 
    pt.category, 
    SUM(od.quantity) AS total_qty_sold
FROM order_details od
JOIN pizzas p 
    ON p.pizza_id = od.pizza_id
JOIN pizza_types pt 
    ON pt.pizza_type_id = p.pizza_type_id
GROUP BY pt.category;

/* 5️. Categories with more than 5,000 pizzas sold */
SELECT 
    pt.category, 
    SUM(od.quantity) AS total_qty_sold
FROM order_details od
JOIN pizzas p 
    ON p.pizza_id = od.pizza_id
JOIN pizza_types pt 
    ON pt.pizza_type_id = p.pizza_type_id
GROUP BY pt.category
HAVING SUM(od.quantity) > 5000;

/* 6️. Pizzas never ordered (LEFT JOIN) */
SELECT 
    p.pizza_id, 
    p.pizza_type_id, 
    p.size
FROM pizzas p
LEFT JOIN order_details od 
    ON p.pizza_id = od.pizza_id
WHERE od.order_details_id IS NULL;

/* 7️. Price differences between different sizes of the same pizza (SELF JOIN) */
SELECT 
    p1.pizza_type_id,
    p1.size AS size_1,
    p2.size AS size_2,
    p1.price AS price_1,
    p2.price AS price_2,
    ABS(p1.price - p2.price) AS price_difference
FROM pizzas p1
JOIN pizzas p2 
    ON p1.pizza_type_id = p2.pizza_type_id
WHERE p1.price < p2.price;

/* ---------------------------------------------------------------------------
✅ End of Project — The Great Pizza Analytics Challenge
--------------------------------------------------------------------------- */
