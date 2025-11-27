/*
    Name: GAURAV MAHAVIR BANWAT
    DTSC660: Data and Database Managment with SQL
    Module 6
    Assignment 4
*/
--------------------------------------------------------------------------------
/*				                 Question 1: Banking DDL           		  		          */
--------------------------------------------------------------------------------
CREATE TABLE branch(
	branch_name varchar(40) CONSTRAINT branch_name_pkey PRIMARY KEY,
	branch_city varchar(40) CONSTRAINT check_branch_city_in_list CHECK (branch_city IN ('Brooklyn','Bronx','Manhattan','Yonkers')),
	assets money
);

CREATE TABLE customer(
	cust_ID INTEGER PRIMARY KEY,
	customer_name VARCHAR(40) NOT NULL,
	customer_street VARCHAR(40),
	customer_city VARCHAR(40)
);


CREATE TABLE loan (
loan_number VARCHAR(40) PRIMARY KEY,
branch_name VARCHAR(40) REFERENCES branch(branch_name) ON DELETE CASCADE ON UPDATE CASCADE,
amount MONEY DEFAULT 0.00
);


CREATE TABLE borrower(
	cust_ID INTEGER,
	loan_number VARCHAR(40),
	CONSTRAINT borrower_pkey PRIMARY KEY (cust_ID,loan_number),
	CONSTRAINT borrower_fkey1 FOREIGN KEY (cust_ID) REFERENCES customer(cust_ID) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT borrower_fkey2 FOREIGN KEY (loan_number) REFERENCES loan(loan_number) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE account(
	account_number INTEGER PRIMARY KEY,
	branch_name VARCHAR(40) REFERENCES branch(branch_name) ON DELETE CASCADE ON UPDATE CASCADE,
	balance MONEY 
);
	

CREATE TABLE depositor(
	cust_ID INTEGER,
	account_number INTEGER,
	CONSTRAINT depositor_pkey1 PRIMARY KEY (cust_ID,account_number),
	CONSTRAINT depositor_fkey1 FOREIGN KEY (cust_ID) REFERENCES customer(cust_ID) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT depositor_fkey2 FOREIGN KEY (account_number) REFERENCES account(account_number) ON DELETE CASCADE ON UPDATE CASCADE
);

---------------------------------------------------------------------------------
--NOTE: PLEASE RUN THE BANKING DATA FILE PROVIDED IN BRIGHTSPACE FOR ASSIGNMENT 4
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
/*				                  Question 2           		  		          */
--Write a query to find all customers who are depositors and return their Customer ID, Branch
--Name, Account Number, and Balance.
--------------------------------------------------------------------------------
SELECT cu.customer_name,cu.cust_id, ac.branch_name, ac.account_number, ac.balance 
FROM customer cu
JOIN depositor de USING (cust_id)
JOIN account ac USING (account_number);


--------------------------------------------------------------------------------
/*				                  Question 3           		  		          */
--Write a query that returns all customers who are both depositors and borrowers. Include in your
--query the customer ID, account number, and loan_number.
--Tip: In order for a customer to show in this query, they should have at least one deposit account
--and one loan. Some customers may have more than one of either, which means you may end
--up with multiple rows per customer.
--------------------------------------------------------------------------------
SELECT DISTINCT d.cust_id, d.account_number, b.loan_number
FROM depositor d, borrower b
WHERE d.cust_id IN(SELECT cust_id FROM borrower);
   
   
   
--------------------------------------------------------------------------------
/*				                  Question 4           		  		          */
--Write a query that finds the account number of all customers who have a deposit account in the
--same city in which they live. Include the customer’s city, branch city, branch name, and account
--number.
--Tip: The “home city” of a deposit account is defined as the city of the branch the account is
--assigned to. In order to find the correct customers for this query, you will need to compare the
--customer’s city to the branch city for the customer’s account(s).
--------------------------------------------------------------------------------
SELECT cu.customer_name, cu.cust_id, d.account_number,cu.customer_city, b.branch_city, b.branch_name
FROM customer cu
JOIN depositor d ON cu.cust_id=d.cust_id
JOIN account ac ON d.account_number=ac.account_number
JOIN branch b ON b.branch_name=ac.branch_name
WHERE b.branch_city=cu.customer_city;



--------------------------------------------------------------------------------
/*				                  Question 5           		  		          */
--Write a query to generate a unique list of customer IDs that are both depositors and borrowers
--WITHOUT USING JOINS.
--Tip: In order for a customer to show in this query, they should have at least one deposit account
--and one loan. As this is a unique list of customer IDs, each customer should appear only once.
--------------------------------------------------------------------------------
SELECT cust_id FROM depositor
INTERSECT
SELECT cust_id FROM borrower;


--------------------------------------------------------------------------------
--NOTE: PLEASE CHANGE THE DATABASE CONNECTION TO THE UNIVERSITY DATASET
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
/*				                  Question 6           		  		          */
--The following question references the university schema instead of the banking schema
--referenced in previous questions. You must use the schema as specified in module 5.1.
--Please write an appropriate query for the question below:
--Write a SQL query using the university schema to find the ID of each student who has never
--taken a course at the university. Do this using no subqueries and no set operations (use an
--outer join).
--Tip: Do not simply use the tot_cred field on the student table. A student may have a tot_cred
--above 0 if they have transferred to the school, but have not taken any courses yet. On the other
--hand, they may have taken and failed a course, or may be actively taking a course that hasn’t
--yet been finished, and they theoretically would have 0 tot_cred but would still have taken
--courses.
--Depending on whether you use the “large” or “small” university dataset, you may need to add
--records to your database to test your query.
--------------------------------------------------------------------------------
SELECT id FROM student
LEFT JOIN takes USING (id)
WHERE takes.id IS NULL;

