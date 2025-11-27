/*
    Name: GAURAV MAHAVIR BANWAT
    DTSC660: Data and Database Managment with SQL
    Module 6
    Assignment 5
*/

--------------------------------------------------------------------------------
/*				                 Question 1:           		  		          */
--Write a query to find the cust_ID and customer name of each customer at
--the bank who only has at least one loan at the bank, and no deposit accounts.
--------------------------------------------------------------------------------
SELECT cust_ID, customer_name 
FROM customer
WHERE (cust_ID NOT IN (SELECT cust_id FROM depositor) AND cust_ID IN (SELECT cust_id FROM borrower));

--------------------------------------------------------------------------------
/*				                  Question 2           		  		          */
--(MUST INCLUDE SUBQUERY): Write a query to find the cust_ID and
--customer name of each customer who lives on the same street and in the same city as
--customer ‘12345’. Include customer ‘12345’ in your query results.
--Tip: Do not hardcode the address for customer 12345. You want to make sure this query
--continues to return the intended results if customer 12345 moves to a new address or
--even changes their name.
--------------------------------------------------------------------------------
SELECT cust_ID, customer_name
FROM customer
WHERE (customer_street=(SELECT customer_street FROM customer WHERE cust_id=12345) AND customer_city=(SELECT customer_city FROM customer WHERE cust_id=12345));


--------------------------------------------------------------------------------
/*				                  Question 3           		  		          */
--(No Joins Allowed): Write a query to find the name of each branch that has
--at least one customer who has a deposit account in the branch and who lives in
--“Harrison”. No branch name should be repeated in the results.
--------------------------------------------------------------------------------
SELECT DISTINCT branch_name FROM account
WHERE (account_number IN(SELECT account_number FROM depositor) 
	  AND
	  (account_number IN (SELECT account_number FROM depositor WHERE cust_id IN 
						  (SELECT cust_id FROM customer WHERE customer_city ='Harrison'))
	  ));
--------------------------------------------------------------------------------
/*				                  Question 4           		  		          */
--(MUST INCLUDE SUBQUERY): Write a query to find the name of each
--customer who has a deposit account at every branch located in “Brooklyn”.
--Tip: Customers returned in the results may have more than one account at a Brooklyn
--branch, and they might also have accounts at branches outside Brooklyn. The key is that
--they must have at least one account at every Brooklyn branch. Do not hardcode the
--names of the Brooklyn branches - this query should still work if a new branch opens in
--Brooklyn or if a branch changes its name.
---------------------------------------------------------------------------------
SELECT cu.customer_name
FROM customer cu
JOIN depositor d USING (cust_id)
JOIN account ac USING (account_number)
JOIN branch b USING (branch_name) as temptable
WHERE branch_city = 'Brooklyn'
GROUP BY customer_name
HAVING count(DISTINCT branch_name) = (SELECT count(DISTINCT branch_name) FROM branch 
									  WHERE branch_city='Brooklyn');

--------------------------------------------------------------------------------
/*				                  Question 5           		  		          */
--Question 5 (MUST INCLUDE SUBQUERY): Write a query that finds the account
--number of all customers whose deposit account is in the city where they live. Include the
--customer’s id, branch city, and customer city.
--Tip: The “home city” of a deposit account is defined as the city of the branch the account
--is assigned to. In order to find the correct customers for this query, you will need to
--compare the customer’s city to the branch city for the customer’s account(s).
--------------------------------------------------------------------------------
SELECT cu.cust_id, b.branch_city, cu.customer_city, ac.account_number
FROM customer cu, branch b, account ac, depositor d
WHERE d.account_number IN (
							SELECT ac.account_number WHERE ac.branch_name IN (
							SELECT b.branch_name WHERE b.branch_city = (SELECT cu.customer_city WHERE(
							cu.cust_id IN (SELECT d.cust_id)
							)
							))
);
    
--------------------------------------------------------------------------------
/*				                  Question 6           		  		          */
--Write a query that returns every customer that has a loan at Yonkahs
--Bankahs. Include the customer name and branch name for verification.
--------------------------------------------------------------------------------
SELECT cu.customer_name, l.branch_name
FROM customer cu, loan l 
WHERE cu.cust_id IN (SELECT cust_id FROM borrower WHERE loan_number IN (SELECT l.loan_number WHERE branch_name = 'Yonkahs Bankahs'));
--------------------------------------------------------------------------------
/*				                  Question 7           		  		          */
--Write a query that returns the name and loan number of all customers with
--loan balances (amounts) higher than $5,000.00.
--------------------------------------------------------------------------------
SELECT cu.customer_name, l.loan_number
FROM customer cu ,loan l
WHERE cu.cust_id IN (SELECT cust_id FROM borrower WHERE loan_number IN (SELECT l.loan_number WHERE amount > '$5000.00'));
