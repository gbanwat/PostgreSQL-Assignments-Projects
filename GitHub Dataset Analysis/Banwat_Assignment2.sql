/*
DTSC 660
Assignment 2
Name: GAURAV MAHAVIR BANWAT

Put your SQL code in the appropriate section of the document below
*/

--Question 1
--Write a query that returns all data for the github table
SELECT * FROM github; 

--Question 2
--Write a query that returns a list of the topics on github (no duplicates)
SELECT DISTINCT topic FROM github;

--Question 3
--Write a query that returns the repo name and star count from largest to smallest
SELECT repo_name, star_count FROM github  
ORDER BY star_count DESC; 

--Question 4
--Write a query that returns a list of topics in alphabetical order (no duplicates)
SELECT DISTINCT topic FROM github
ORDER BY topic;

--Question 5
--Write a query that returns all repo names that have a star count greater than 2000
SELECT repo_name FROM github
WHERE star_count>2000;

--Question 6
--Write a query that returns all repo names that have a star count greater than 3000 and
--are in the 3d topic
SELECT repo_name FROM github
WHERE star_count>3000 AND topic='3d';

--Question 7 
--Write a query that returns all repo names that are in the aws, azure, or chrome topics
--and that have a star count less than 1000
SELECT repo_name FROM github
WHERE topic IN ('aws','azure','chrome')AND star_count<1000;

--Question 8
--Write a query returning the user name, repo name, and repo link where the link contains
--‘ext’ (note this is NOT case sensitive)
SELECT user_name, repo_name, repo_link FROM github
WHERE repo_link ILIKE '%ext%';

--Question 9
--Write a query that returns all columns for chrome topics whose star count is larger than
--5000
SELECT * FROM github
WHERE topic='chrome' AND star_count>5000;

--Question 10
--Write a query that returns all the username and respective repo name where the star
--count is greater than 1000 and less than 15000
SELECT user_name, repo_name FROM github
WHERE star_count>1000 AND star_count<15000;

--Question 11
--Write a query that returns an alphabetical list of usernames who have repos with star
--counts of higher than 15000 (no duplicates)
SELECT DISTINCT user_name FROM github
WHERE star_count>15000
ORDER BY user_name;


--Question 12
--Write a query that returns a list of usernames that start with ‘Add’ or end with ‘on’ (Note
--this IS case sensitive). (no Duplicates)
SELECT DISTINCT user_name FROM github
WHERE user_name LIKE 'Add%' OR user_name LIKE '%on';

--Question 13
--Write a query that returns an alphabetical list of topics that have at least one repo with a
--star count greater than 100,000 (no duplicates)
SELECT DISTINCT topic FROM github
WHERE star_count>100000
ORDER BY topic;



--Question 14
-- Write a query that returns a list of topics that contain null star counts (if any exist)
--(duplicates allowed)
SELECT topic FROM github
WHERE star_count ISNULL;


--Question 15
--Write a query that returns a list of topics, usernames, and star_count if the star count is
--at least 100,000 but no more than 200,000 and whose topic starts with ‘a’
SELECT topic, user_name, star_count FROM github
WHERE star_count >= 100000 AND star_count <=200000 AND topic LIKE 'a%';
