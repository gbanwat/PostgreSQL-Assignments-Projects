---

# 🏦 SQL Assignment 4 — Banking Database Design & Querying

This repository contains my submission for **DTSC660 – Data and Database Management with SQL (Module 6, Assignment 4)**.
This assignment focuses on designing a complete banking database schema using PostgreSQL and writing multi-table relational queries based on the provided dataset. 

---

## 📘 Overview

The objective of this assignment is to apply SQL DDL and DML concepts from Modules 5 and 6 to build a fully structured banking database and run analytical queries across multiple related tables.

Students define a PostgreSQL-compliant schema, enforce relational integrity through constraints, import dataset values, and implement multi-table queries to analyze customer, loan, and account relationships.

The assignment consists of **one SQL file** containing all DDL and DML solutions.

---

## 📂 Included File

### **`Banwat_Assignment4.sql`**

This SQL file includes:

* All six `CREATE TABLE` statements for the banking schema
* Fully defined PostgreSQL constraints, including:

  * Primary Keys
  * Foreign Keys
  * CHECK constraints
  * NOT NULL constraints
  * DEFAULT values
  * ON UPDATE/ON DELETE CASCADE
* All queries for Questions 2–6
* All syntax fully compatible with PostgreSQL and CodeGrade requirements

---

## 🧩 Part 1 — Database Schema (DDL)

Before writing queries, the following steps were completed:

* Defined all six tables in the required order:
  **branch, customer, loan, borrower, account, depositor**
* Applied the exact attribute names specified in the assignment
* Assigned appropriate PostgreSQL data types (e.g., numeric for monetary fields)
* Used `varchar(40)` where required
* Enforced all relational rules such as:

  * Branch updates cascading to loan/account tables
  * Customer updates cascading to borrower/depositor tables
* Verified table creation using `SELECT * FROM table;` after importing data

This ensures the database structure fully matches assignment expectations.


---

## 📈 Part 2 — Querying the Banking Data

The SQL file includes solutions to all required queries, such as:

* Returning all customers who are depositors
* Identifying customers who are both depositors and borrowers
* Matching customer cities with branch locations for their accounts
* Listing customer IDs who have deposits **and** loans (without using joins)
* Running an outer-join query on the **University schema** to identify students who have never taken a course

All queries follow PostgreSQL conventions and return ≤ 15 rows, as required.

---

## ✔️ Key Requirements Followed

* Exact table and attribute names from the assignment
* PostgreSQL-specific syntax only (no MySQL, T-SQL, or Oracle flavor)
* Proper use of CASCADE actions, constraints, and defaults
* Queries tested on the provided dataset
* One final SQL file submitted to CodeGrade
* No zip archives, no unsupported SQL features
* All queries produce correct outputs per assignment rules

---

## 🎯 Purpose

This assignment demonstrates the ability to:

* Translate a conceptual schema into DDL using PostgreSQL
* Enforce integrity through relational constraints
* Work with interconnected banking data across six tables
* Write complex multi-table SQL queries
* Use joins, cascades, and constraint logic effectively
* Integrate both banking and university database concepts in one assignment

---


