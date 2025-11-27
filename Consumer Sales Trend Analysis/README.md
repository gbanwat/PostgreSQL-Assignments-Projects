---

# 📊 SQL Assignment 6 — Consumer Sales Trend Analysis (Module 7)

This repository contains my submission for **DTSC660 – Data and Database Management with SQL (Module 7, Assignment 6)**.
This assignment focuses on exploring large-scale consumer sales data and performing analytical PostgreSQL queries to uncover trends and insights. 

---

## 📘 Overview

The goal of this assignment is to work with a real-world customer spending dataset and apply SQL techniques learned in Modules 5 and 7—such as aggregation, grouping, filtering, revenue calculations, and sub-category analytics.

Students import a CSV dataset, build a properly structured table, and write multi-step analytical queries to evaluate sales behavior across years, categories, age groups, and countries.

The assignment consists of **one SQL file** containing all required tasks and queries.

---

## 📂 Included File

### **`Banwat_Assignment6.sql`**

This SQL file includes:

* Table creation logic and data import using PostgreSQL’s `COPY` command
* Verification query to ensure all CSV data is loaded correctly
* All six required analytical SQL queries
* Syntax fully compatible with PostgreSQL and pgAdmin execution
* Solutions written inside the provided Assignment 6 template structure

---

## 🧩 Part 1 — Table Creation & Data Import

Before running analysis queries, the following steps were completed:

* Downloaded the `customer_spending.csv` file from the Assignment 6 folder
* Placed the file into a public directory and copied the full file path
* Created the target table according to dataset column definitions
* Loaded the dataset using PostgreSQL’s `COPY` command
* Verified successful import using:

  ```sql
  SELECT * FROM customer_spending LIMIT 5;
  ```
* Ensured all columns matched the CSV structure and data types expected

This ensures the dataset is properly imported and ready for querying.


---

## 📈 Part 2 — Data Analysis Queries

The SQL file includes correct implementations for all six required analytical tasks, such as:

* Identifying top-selling product categories by revenue in **2016**
* Calculating average unit price, unit cost, and profit margin for all **2015** sub-categories
* Counting total female buyers in the **Clothes** category
* Computing average product quantity and cost by **age group** and **sub-category**
* Listing countries with more than **30 transactions** by buyers aged **18–25**
* Returning sub-categories with at least **10 total records**, along with rounded averages

All queries were validated to avoid extraneous rows and follow all grouping and sorting rules specified.

---

## ✔️ Key Requirements Followed

* PostgreSQL-only syntax (no T-SQL, MySQL, or Oracle variants)
* Each query ends with a semicolon for CodeGrade execution
* No malformed SQL—file runs cleanly in pgAdmin
* Exact naming structure: `LastName_Assignment6.sql`
* No duplicate values where not allowed
* All results match the analytical expectations for the dataset
* No use of limiting clauses (`LIMIT`) to force acceptable row counts

---

## 🎯 Purpose

This assignment demonstrates the ability to:

* Import and manage large datasets using PostgreSQL
* Perform multi-dimensional sales analysis using SQL
* Work with revenue, cost, margin, age groups, and category-level insights
* Apply grouping, aggregation, filtering, and rounding operations
* Produce accurate, analytical results under strict grading requirements

---


