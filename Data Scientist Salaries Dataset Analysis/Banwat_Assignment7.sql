/*
    Name: GAURAV MAHAVIR BANWAT
    DTSC660: Data and Database Managment with SQL
    Module 8
    Assignment 7
	Dataset Chosen : Data Scientist Salaries
	Why did I choose this dataset?
	I will be graduating with a Master's in Data Science degree by October 2023. And I plan to study the Data Science market,
	available jobs and salaries at particular locations as I am soon going to start my job search for a Data Scientist role.
	I thought using this dataset will be a good beginning to study the market and get a good idea of what duties are expected 
	in this role. For the above mentioned reason, I decided to choose this dataset for this assignment. 

*/
-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
/*				                 Table Creation		  		          */
-------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE dtsc_salary(
	timestamp timestamp,
	company VARCHAR(40),
	level VARCHAR(80),
	title VARCHAR(40),
	totalyearlycompensation INTEGER,
	location VARCHAR(80),
	yearsofexperience NUMERIC(5,2),
	yearsatcompany NUMERIC(5,2),
	tag TEXT,
	basesalary NUMERIC(12,5),
	stockgrantvalue NUMERIC (15,5),
	bonus NUMERIC(12,5),
 	gender VARCHAR(40),
	otherdetails TEXT,
	cityid VARCHAR(5),
	dmaid VARCHAR(4),
	rowNumber VARCHAR(5),
	Masters_Degree BOOLEAN,
	Bachelors_Degree BOOLEAN,
	Doctorate_Degree BOOLEAN,
	Highschool BOOLEAN,
	Some_Sollege BOOLEAN,
	Race_Asian BOOLEAN,
	Race_White BOOLEAN,
	Race_Two_Or_More BOOLEAN,
	Race_Black BOOLEAN,
	Race_Hispanic BOOLEAN,
	Race VARCHAR(15),
	Education VARCHAR(20)
	);

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
/*				                 Import Data           		  		          */
-------------------------------------------------------------------------------------------------------------------------------------

COPY dtsc_salary
FROM 'C:/Users/Public/Levels_Fyi_Salary_Data.csv'
WITH (FORMAT CSV,HEADER);


-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
/*				                 Question 1:       		  		              */
--Create a backup of your imported table (no comments required)
-------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE dtsc_salary_backup AS
SELECT *
FROM dtsc_salary;

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
/*				                 Question 2: 		  		                  */
--Create a duplicate column in the table (no comments required)
-------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE dtsc_salary
ADD duplicate_level VARCHAR(80) ;

UPDATE dtsc_salary
SET duplicate_level = level;

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
/*				                  Question 3:          		  		          */
--Locate and update values representing missing data in one column and perform ONE of
--the following modifications:
--	a. Change values so that they are correctly labeled and recognized by SQL as
--		NULL values
--	b. Change their values to another value that accurately represents or reflects the
--		data (such as substituting the mean of the column for the value)
--	c. Remove the data containing null values
-------------------------------------------------------------------------------------------------------------------------------------
--For this question, we will try Option a and replace missing values as "NULL" if the missing values are represented with certain
--numbers or text.


--Lets view some of the columns of the dataset.	
SELECT (yearsofexperience+yearsatcompany) AS total_exp, location, basesalary,stockgrantvalue,bonus FROM dtsc_salary
WHERE basesalary=0 ;

--Carefully looking at the above selected data, it seems that basesalary, stockgrantvalue and bonuses had missing values 
--which were input as 0 in the Table. With 'x' years of experience the salary of an individual cannot be zero and this helps
--in concluding that 0 means a missing value in basesalary, stockgrantvalue and bonus columns of the dataset.

--We will now change the missing values in basesalary column represented as 0 with NULL value.
--The below query will change the 0 value in basesalary column with NULL representation.
UPDATE dtsc_salary
SET basesalary = NULL
WHERE basesalary=0;

--VERIFYING the number of NULL values(rows) which are replaced from 0
SELECT basesalary FROM dtsc_salary
WHERE basesalary ISNULL;
--The number of null rows in basesalary is now 2304

--Checking the number of rows with '0' value in backup dataset
SELECT basesalary FROM dtsc_salary_backup
WHERE basesalary=0;
--The number of rows with 0 value is 2304
--Hence it is verified that all the rows with 0 value in the basesalary column are now replace as 'null'



-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
/*				                  Question 4           		  		          */
--Perform step 3 using a different method (e.g. a, b or c from above) on a different column
--	a. Change values so that they are correctly labeled and recognized by SQL as
--		NULL values
--	b. Change their values to another value that accurately represents or reflects the
--		data (such as substituting the mean of the column for the value)
--	c. Remove the data containing null values
-------------------------------------------------------------------------------------------------------------------------------------
--For this question we will remove the rows from the dataset which have a missing value in the stockgrantvalue column 
--From our previous obeservation, we concluded that the value of '0' means a missing value in the stockgrantvalue column

--The below query will delete all the rows from the dataset which has a value of '0' under the stockgrantvalue column in the dataset.
DELETE FROM dtsc_salary
WHERE stockgrantvalue = 0;

--The below query verifies if all the targetted rows are removed from the dataset.
SELECT * FROM dtsc_salary
WHERE stockgrantvalue=0;

--On checking the output from the above query, we get to know that we have successfully removed all the rows with a stockgrantvalue
--of '0' from the dataset.

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
/*				                  Question 5           		  		          */
--Group similar values (i.e. - Sr., Senior, Sr from the video), misspelled, or inconsistent
--data for one column such that the data is correct and consistent. Only one group of
-------------------------------------------------------------------------------------------------------------------------------------
--We check if any of the same company names are edited or represented in the 
--dataset in multiple ways.
SELECT company, count(company) FROM dtsc_salary
GROUP BY company
ORDER BY company;

--With the above Query, we find that the company Lyft is edited in two different ways in the dataset
-- 1. 'lyft'
-- 2. 'Lyft'

--In the following query, we will replace 'lyft' as 'Lyft', to make it consistent.
UPDATE dtsc_salary
SET company = 'Lyft'
WHERE company = 'lyft';

--We check it again if it has been replaced or not.
SELECT company, count(company) FROM dtsc_salary
GROUP BY company
ORDER BY company;
--Checking the output of the above query, we now see that the company name 'lyft'
--is now replaced with 'Lyft' and also the count for 'Lyft' has been increased by 1.


-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
/*				                  Question 6           		  		          */
--Repeat step 5 on another column
-------------------------------------------------------------------------------------------------------------------------------------
--We check if any of the same level names are edited or represented in the 
--dataset in multiple ways.
SELECT level, count(level) FROM dtsc_salary
GROUP BY level
ORDER BY level;

--With the above Query, we find that the level AVP is edited in two different ways in the dataset
-- 1. 'Avp'
-- 2. 'AVP'
--In the following query, we will replace 'Avp' as 'AVP', to make it consistent.
UPDATE dtsc_salary
SET level = 'AVP'
WHERE level = 'Avp';

--We check it again if it has been replaced or not.
SELECT level, count(level) FROM dtsc_salary
GROUP BY level
ORDER BY level;
--Checking the output of the above query, we now see that the level name 'Avp'
--is now replaced with 'AVP' and also the count for 'Lyft' has been increased by 1.

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
/*				                  Question 7           		  		          */
--Pick one other method of cleaning demonstrated in the book or videos that you feel will
--make the data more useful. If you are unsure whether your method meets the criteria,
--please request feedback PRIOR TO SUBMITTING.
-------------------------------------------------------------------------------------------------------------------------------------
--For this question, we will split location column into three columns namely ('city, state, country')which I believe will be very
--useful for a data analyst to look at.
--We see that the location column has details of city, state and country separated by a comma.
--So we first create three new columns with VARCHAR data type and fill in these columns with the respective data
--using the split_part function.
--Also, after doing so, we come to know that the country column has blank values when the city and state belong to USA.
--So once we split the values, we then replace the blank values in the country column with 'USA'


--Adding new columns
ALTER TABLE dtsc_salary
ADD city VARCHAR(25),
ADD state VARCHAR(25),
ADD country VARCHAR(25);

--Updating the new columns with respective data from the location column.
UPDATE dtsc_salary
SET city = split_part(location, ',', 1);

UPDATE dtsc_salary
SET state = split_part(location, ',', 2);

UPDATE dtsc_salary
SET country =split_Part(location,',',3);

--Updating the blank values in the country column with 'USA' when the state and city belong to USA
UPDATE dtsc_salary
SET country = 'USA'
WHERE city NOTNULL AND state NOTNULL AND country = '';


--SELECT * FROM dtsc_salary;

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
