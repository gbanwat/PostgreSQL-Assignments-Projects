---

# 🏦 SQL Assignment 5 — Advanced Banking Queries (Module 6)

This repository contains my submission for **DTSC660 – Data and Database Management with SQL (Module 6, Assignment 5)**.
This assignment extends the banking database created in Assignment 4 and focuses on writing advanced PostgreSQL queries using subqueries, filtering logic, and multi-table relationships. 

---

## 📘 Overview

The goal of this assignment is to perform deeper analysis on the banking dataset using SQL techniques learned in Module 6.
Students use their previously created banking database and write a series of targeted queries involving subqueries, conditional checks, and customer/branch/loan relationships.

The assignment consists of **one SQL file** containing all required tasks and queries.

---

## 📂 Included File

### **`Banwat_Assignment5.sql`**

This SQL file includes:

* All seven required banking queries
* Required subqueries where specified
* Logic-based filtering to avoid incorrect row counts
* Solutions that follow all PostgreSQL conventions
* All results tested to ensure each query returns **1 to 4 rows only**, as required

---

## 🧩 Part 1 — Working With the Banking Database

Before writing queries, the Assignment 4 PostgreSQL schema and dataset were loaded, ensuring:

* All six tables (`branch`, `customer`, `loan`, `borrower`, `account`, `depositor`) were available
* Relationships, keys, and constraints were intact
* Data matched the original dataset provided with the course
* Queries produced accurate results with no redundant rows or cartesian products

This guarantees correct behavior for all downstream analysis.

---

## 📈 Part 2 — Advanced Query Requirements

The SQL file includes solutions to all required analytical queries, such as:

* Identifying customers who **only** have loans
* Using a subquery to dynamically retrieve customers living at the same address as customer `12345`
* Finding branches with depositors living in **Harrison** (without using joins)
* Determining customers who have accounts at **every** branch located in Brooklyn
* Matching customers with accounts in the **same city** where they live
* Listing customers with loans at **Yonkahs Bankahs**
* Finding loan holders with balances **above $5,000**

All queries were constructed to strictly follow assignment rules (subqueries required, no joins allowed, etc.).

---

## ✔️ Key Requirements Followed

* PostgreSQL-specific syntax only
* Subqueries included where required
* No joins used in Question 3
* Each query returns **1–4 rows**, with no use of `LIMIT`
* All logic tested against the provided dataset
* SQL formatted for CodeGrade compatibility
* No extraneous rows beyond correct results

---

## 🎯 Purpose

This assignment demonstrates the ability to:

* Apply advanced SQL filtering using subqueries
* Navigate multi-table banking relationships
* Write precise logic-based queries without relying on joins
* Work with real relational constraints (customers, branches, loans, accounts)
* Produce accurate, efficient PostgreSQL queries under strict evaluation criteria

---


