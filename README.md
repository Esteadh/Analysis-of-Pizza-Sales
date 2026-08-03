# Analysis-of-Pizza-Sales
The goal was to conduct a general study on pizza sales using Microsoft SQL Server. This study helped improve SQL skills.
![MSSQL](https://img.shields.io/badge/Database-MS_SQL_Server-red.svg)
![PowerBI](https://img.shields.io/badge/Tool-Power_BI-yellow.svg)
## Project Summary
The goal of this project was to analyze 46,000 rows of pizza sales data obtained from Kaggle. After performing the necessary data cleaning on the dataset, 14 different queries were generated using SQL Server.
## Sample Query and Output
##1.KPI’S






##1.TOTAL REVENUE 
SELECT SUM(total_price) AS TOTAL_REVENUE FROM pizza_sales
 
 <img width="263" height="90" alt="image" src="https://github.com/user-attachments/assets/60dd64c6-62f1-4026-b3ed-3ff0e846e6a6" />






##2. AVARAGE ORDER VALUE 

SELECT SUM(total_price)/count(DISTINCT order_id) AS AVG_ORDER_VALUE FROM pizza_sales

<img width="228" height="56" alt="image" src="https://github.com/user-attachments/assets/ac167f42-c3b5-40f3-94c2-a9c1f021e73b" />

 




##3. TOTAL PİZZA SOLD
SELECT SUM(quantity) AS TOTAL_PİZZA_SOLD from pizza_sales

<img width="234" height="64" alt="image" src="https://github.com/user-attachments/assets/7b6e4cfb-233e-4ea0-98cd-40eef31e79f7" />





##4. TOTAL ORDERS 
SELECT COUNT(DISTINCT order_id) AS TOTAL_ORDERS from pizza_sales
 
 <img width="188" height="51" alt="image" src="https://github.com/user-attachments/assets/e619925a-0fd6-4054-8d7c-6e57e3281c5b" />





##5. AVARAGE PIZZAS PER ORDER
SELECT CAST(CAST(SUM(quantity) AS decimal (10,2)) / CAST(COUNT(DISTINCT order_id) AS decimal (10,2)) AS decimal (10,2)) AS AVG_PIZZAS_PER_ORDER from pizza_sales

 <img width="254" height="50" alt="image" src="https://github.com/user-attachments/assets/fb4ca427-8aa5-46f7-b18e-89893994719a" />






##B. DAILY TRENDS FOR TOTAL ORDERS
SELECT DATENAME(DW,order_date) AS ORDER_DAY ,COUNT(DISTINCT order_id) AS TOTAL_ORDERS
from pizza_sales
GROUP BY DATENAME(DW,order_date)

 <img width="300" height="200" alt="image" src="https://github.com/user-attachments/assets/f12e8c8a-604a-4e83-8969-9f03744a0aa2" />







##C. HOURLY TREND FOR TOTAL ORDERS
SELECT DATEPART(HOUR,order_time) AS ORDER_HOURS, COUNT (DISTINCT order_id) AS TOTAL_ORDERS 
from pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)
 
 <img width="325" height="403" alt="image" src="https://github.com/user-attachments/assets/36bd7a71-a416-4a22-9a04-1523b8bde275" />




##D. % OF SALES BY PIZZA CATEGORY
SELECT pizza_category, CAST(SUM(total_price) AS decimal(10,2)) AS TOTAL_REVENUE, 
CAST(SUM(total_price) * 100/ ( SELECT SUM(total_price) from pizza_sales) AS decimal (10,2)) AS PCT
from pizza_sales
GROUP BY pizza_category

<img width="378" height="129" alt="image" src="https://github.com/user-attachments/assets/64bc87ec-1f1f-42d8-b5dc-43cde7bc4696" />

 



##E. % OF SALES BY PIZZA SIZE
SELECT pizza_size, CAST(SUM(total_price) AS decimal(10,2)) AS TOTAL_REVENUE, 
CAST(SUM(total_price) * 100/ ( SELECT SUM(total_price) from pizza_sales) AS decimal (10,2)) AS PCT
from pizza_sales
GROUP BY pizza_size

<img width="353" height="156" alt="image" src="https://github.com/user-attachments/assets/53ad47c1-4ead-4ee3-8edd-8e86f2bdfbc6" />

 





##F. TOTAL PİZZAS SOLD BY PİZZA CATEGORY
SELECT pizza_category, sum(quantity) as TOTAL_QUANTİTY_SOLD
from pizza_sales
GROUP BY pizza_category
ORDER BY TOTAL_QUANTİTY_SOLD

<img width="370" height="133" alt="image" src="https://github.com/user-attachments/assets/5897d484-1dd4-4a8e-a55a-8a1f3053d0d9" />

 




##G. TOP 5 BEST SELLERS BY TOTAL PIZZAS SOLD
SELECT TOP 5 pizza_name, SUM(quantity) AS TOTAL_PIZZAS_SOLD from pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_PIZZAS_SOLD DESC

<img width="434" height="141" alt="image" src="https://github.com/user-attachments/assets/4005c939-749b-41c4-b8a5-6906f5332502" />

 




##H. BOTTOM 5 BEST SELLERS BY TOTAL PIZZAS SOLD
SELECT TOP 5 pizza_name, SUM(quantity) AS TOTAL_PIZZAS_SOLD from pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_PIZZAS_SOLD ASC


<img width="434" height="148" alt="image" src="https://github.com/user-attachments/assets/33167fd2-6af8-4d6a-8343-661a74dbbe12" />

 

## ✉️ Contact
* **First Name, Last Name:** Emircan Yucak
* **LinkedIn:** www.linkedin.com/in/emircan-yucak-09a625427
* **Email:** emir_yucak1979@hotmail.com
