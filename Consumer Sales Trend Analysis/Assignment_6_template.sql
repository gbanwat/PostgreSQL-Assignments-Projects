/*
    Name: GAURAV MAHAVIR BANWAT
    DTSC660: Data and Database Managment with SQL
    Module 7
    Assignment 6


*/

--------------------------------------------------------------------------------
/*				                 Table Creation		  		          */
--------------------------------------------------------------------------------
CREATE TYPE gender AS ENUM('F','M');
CREATE TABLE consumer_spending(
    date DATE,
    year INTEGER,
    month VARCHAR(10) ,
    customer_age INTEGER,
	customer_gender gender,
	country VARCHAR(20),
	state VARCHAR(20),
	product_category VARCHAR(20),
	sub_category VARCHAR(25),
    quantity INTEGER,
	unit_cost NUMERIC (15,7),
	unit_price NUMERIC (15,7),
	cost NUMERIC (15,7),
	revenue NUMERIC(15,7)
);
    


--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
/*				                 Import Data           		  		          */
--------------------------------------------------------------------------------
COPY consumer_spending
FROM 'C:/Users/Public/customer_spending.csv'
WITH (FORMAT CSV,HEADER);
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
/*				                 Question 1: 		  		          */
--Write a query that returns the top selling (revenue) categories for the year 2016. Include
--the category name and total revenue and organize alphabetically by category name.
--------------------------------------------------------------------------------
SELECT product_category, ROUND(SUM(revenue),2) AS total_revenue
FROM consumer_spending
WHERE year=2016
GROUP BY product_category
ORDER BY product_category;

--------------------------------------------------------------------------------
/*				                  Question 2           		  		          */
--Write a query that returns a list of sub categories and their average unit price, average
--unit cost, and the difference between these values called margin for the year 2015.
--Organize the results alphabetically by sub category.
--------------------------------------------------------------------------------
SELECT sub_category, ROUND(AVG(unit_price),2) AS avg_unit_price, ROUND(AVG(cost),2) AS avg_cost, 
	ROUND(AVG(cost-unit_price),2) AS margin
FROM consumer_spending
WHERE year=2015
GROUP BY sub_category
ORDER BY sub_category;
--------------------------------------------------------------------------------
/*				                  Question 3           		  		          */
--Write a query that returns the total number of female buyers who purchased clothes.
--------------------------------------------------------------------------------
SELECT COUNT(customer_gender)
FROM consumer_spending
WHERE customer_gender ='F' AND product_category = 'Clothing';
   
--------------------------------------------------------------------------------
/*				                  Question 4           		  		          */
--Write a query that provides the average quantity and average cost of products
--purchased by each age and by sub category. Organize the columns with age, sub
--category, average quantity, and average cost. Make the data organized by age oldest to
--youngest and then by sub category alphabetically.
--------------------------------------------------------------------------------
SELECT customer_age,sub_category,ROUND(AVG(quantity ::NUMERIC),2) AS average_quantity,
	ROUND(AVG(cost),2) AS average_cost
FROM consumer_spending
GROUP BY customer_age, sub_category
ORDER BY customer_age DESC, sub_category;

--------------------------------------------------------------------------------
/*				                  Question 5           		  		          */
--Write a query that returns a list of countries that had more than 30 transactions to
--customers between the ages of 18-25 in the entire data set.
--------------------------------------------------------------------------------
SELECT country
FROM consumer_spending
WHERE customer_age >=18 AND customer_age <=25
GROUP BY country
HAVING (COUNT(customer_age)>30);

--------------------------------------------------------------------------------
/*				                  Question 6           		  		          */
--Write a query that returns a list of sub categories, the average quantity and average cost
--both rounded to 2 decimal places. Only include sub categories that have at least 10
--records in the data set. Organize the data by sub category alphabetically.
--------------------------------------------------------------------------------
SELECT sub_category, ROUND(AVG(quantity::NUMERIC(10,2)),2) AS avg_quantity,
	ROUND(AVG(cost),2) AS avg_cost
FROM consumer_spending
GROUP BY sub_category
HAVING (COUNT(*)>=10)
ORDER BY sub_category;


--------------------------------------------------------------------------------
