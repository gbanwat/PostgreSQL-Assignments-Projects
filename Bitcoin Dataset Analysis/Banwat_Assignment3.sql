/*
Assignment 3 Template
Make sure you read all instructions before completing this template. 
Student Name: GAURAV MAHAVIR BANWAT
*/
---Question 1
--	1. Create the table with appropriate data types
--		a. Name the table bitcoin_data
--		b. Reuse the column titles from the csv but remove any capitalization
--		c. Change the date column to trans_date
--		d. Change size to code_size
CREATE TABLE bitcoin_data(
    trans_date DATE,
    priceusd NUMERIC(10,3),
	code_size INTEGER,
	sentbyaddress varchar(8),
	transactions INTEGER,
	mining_proftiability NUMERIC(10,3),
	sentinusd BIGINT,
	transactionfees NUMERIC(10,5),
	median_transaction_fee NUMERIC(10,5),
	confirmationtime NUMERIC(10,3),
	marketcap BIGINT,
	transactionvalue INTEGER,
	mediantransactionvalue NUMERIC(10,3),
	tweets INTEGER,
	google_trends NUMERIC(10,3),
	fee_to_reward NUMERIC(10,3),
	activeaddresses varchar(8),
	top100cap NUMERIC(10,3)
	);
    
---Question 2
---	2. Write the copy statement to bring the code into the database
---		a. Remember that if you choose an incompatible data type, you can enter the
---		   command DROP TABLE bitcoin_data to remove the table and restart	
COPY bitcoin_data
FROM 'C:/Users/Public/bitcoin_data.csv'
WITH (FORMAT CSV,HEADER);

---Question 3 
---	3. Write a query that returns all the data in the table
SELECT * FROM bitcoin_data;

---Question 4
---	4. Write a query that returns the transaction date and the code size divided by the
---	   transactions with the column name difficulty.
SELECT trans_date, CAST(code_size AS NUMERIC)/CAST(transactions AS NUMERIC) AS difficulty  FROM bitcoin_data;

--Question 5
---5. Write a query that returns the transaction date and the product of median transaction fee
---	  and transactions with the column name daily cost.
SELECT trans_date, median_transaction_fee*transactions AS daily_cost FROM bitcoin_data;

---Question 6
---6. Write a query that returns the transaction date and the amount sent in USD divided by
---	  the number of transactions with the column name average transaction. Also include the
---	  median transaction value
SELECT trans_date, CAST(sentinusd AS NUMERIC)/CAST(transactions AS NUMERIC) AS average_transaction,mediantransactionvalue FROM bitcoin_data;


---Question 7
---7. Write a query that returns the average price in USD with the column name avg price.
SELECT AVG(priceusd) AS avg_price FROM bitcoin_data;

---Question 8
---8. Write a query that returns the total number of transactions with the column name total
---   transactions
SELECT SUM(transactions) AS total_transactions FROM bitcoin_data;


---Question 9
---9. Write a query that returns the largest value from the market cap column and call it max
---   cap.
SELECT MAX(marketcap) AS max_cap FROM bitcoin_data;

---Question 10
---10.Write a query that returns the mean number of tweets and call it the avg daily tweets.
SELECT AVG(tweets) AS avg_daily_tweets FROM bitcoin_data;