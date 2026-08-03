--SQL QUERYS FOR PIZZA SALES

--1.TOTAL REVENUE 
SELECT SUM(total_price) AS TOTAL_REVENUE FROM pizza_sales

-- 2.AVARAGE ORDER VALUE 
SELECT SUM(total_price)/count(DISTINCT order_id) AS AVG_ORDER_VALUE FROM pizza_sales


-- 3. TOTAL PİZZA SOLD

SELECT SUM(quantity) AS TOTAL_PİZZA_SOLD from pizza_sales


--4.TOTAL ORDERS 
SELECT COUNT(DISTINCT order_id) AS TOTAL_ORDERS from pizza_sales

--5. AVARAGE PIZZAS PER ORDER
SELECT CAST(CAST(SUM(quantity) AS decimal (10,2)) / CAST(COUNT(DISTINCT order_id) AS decimal (10,2)) AS decimal (10,2)) AS AVG_PIZZAS_PER_ORDER 
from pizza_sales

-- 6. DAILY TRENDS FOR TOTAL ORDERS
SELECT DATENAME(DW,order_date) AS ORDER_DAY ,COUNT(DISTINCT order_id) AS TOTAL_ORDERS
from pizza_sales
GROUP BY DATENAME(DW,order_date)

-- 7. HOURLY TREND FOR TOTAL ORDERS
SELECT DATEPART(HOUR,order_time) AS ORDER_HOURS, COUNT (DISTINCT order_id) AS TOTAL_ORDERS 
from pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)


--8. . % OF SALES BY PIZZA CATEGORY
SELECT pizza_category, CAST(SUM(total_price) AS decimal(10,2)) AS TOTAL_REVENUE, 
CAST(SUM(total_price) * 100/ ( SELECT SUM(total_price) from pizza_sales) AS decimal (10,2)) AS PCT
from pizza_sales
GROUP BY pizza_category


--9.% OF SALES BY PIZZA SIZE
SELECT pizza_size, CAST(SUM(total_price) AS decimal(10,2)) AS TOTAL_REVENUE, 
CAST(SUM(total_price) * 100/ ( SELECT SUM(total_price) from pizza_sales) AS decimal (10,2)) AS PCT
from pizza_sales
GROUP BY pizza_size

--10. TOTAL PİZZAS SOLD BY PİZZA CATEGORY
SELECT pizza_category, sum(quantity) as TOTAL_QUANTİTY_SOLD
from pizza_sales
GROUP BY pizza_category
ORDER BY TOTAL_QUANTİTY_SOLD


--11.TOP 5 BEST SELLERS BY TOTAL PIZZAS SOLD
SELECT TOP 5 pizza_name, SUM(quantity) AS TOTAL_PIZZAS_SOLD from pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_PIZZAS_SOLD DESC


--12.BOTTOM 5 BEST SELLERS BY TOTAL PIZZAS SOLD
SELECT TOP 5 pizza_name, SUM(quantity) AS TOTAL_PIZZAS_SOLD from pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_PIZZAS_SOLD ASC
