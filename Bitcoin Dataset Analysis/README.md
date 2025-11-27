---

# 📊 Bitcoin Transaction Analysis (2009 Dataset)

This repository contains my submission for **DTSC660 – Data and Database Management with SQL (Module 4, Assignment 3)**.
This assignment focuses on calculating statistical insights from historical Bitcoin transaction data using PostgreSQL queries.

## 📘 Overview

The goal of this assignment is to work with a real-world Bitcoin dataset and apply SQL techniques learned in Module 4—such as mathematical operations, aggregations, averages, and column transformations.
Students import a CSV dataset, define appropriate data types, and perform analytics queries to produce meaningful financial/transaction metrics.

The assignment consists of **one SQL file** containing all required tasks and queries.

---

## 📂 Included File

### **`Banwat_Assignment3.sql`**

This SQL file includes:

* Table creation statements with proper PostgreSQL data types
* A `COPY` command to import the Bitcoin dataset
* All 10 queries required in Part 2 of the assignment
* All syntax fully compatible with PostgreSQL and pgAdmin execution

---

## 🧩 Part 1 — Table Creation & Data Import

Before writing analysis queries, the following steps were completed:

* Downloaded the `bitcoin_data.csv` file
* Created a properly structured table named **`bitcoin_data`**, following instructions:

  * All column names converted to lowercase
  * The `date` column renamed to **`trans_date`**
  * The `size` column renamed to **`code_size`**
* Selected appropriate data types based on field content
* Imported the data using PostgreSQL’s `COPY` command
* Verified the import with a basic `SELECT * FROM bitcoin_data;`

This ensures the table structure and dataset fully match assignment expectations.

---

## 📈 Part 2 — Data Analysis Queries

The SQL file includes solutions to all required analytical queries, such as:

* Returning all dataset records
* Computing relationships between code size and transaction count (difficulty)
* Calculating daily cost based on transaction fees
* Averaging transaction values
* Finding overall averages (e.g., Bitcoin price, tweets per day)
* Summing transactions
* Identifying maximum market capitalization

All queries produce correct rows only, with optional columns allowed per assignment rules.

---

## ✔️ Key Requirements Followed

* Table named **`bitcoin_data`**
* All column names lowercase and renamed where required
* PostgreSQL-specific syntax only
* Each query ends with a semicolon
* No extraneous rows in query results
* Numeric operations performed according to assignment instructions
* Compatible with CodeGrade auto-grading system

---

## 🎯 Purpose

This assignment demonstrates the ability to:

* Structure a database table from raw CSV data
* Perform mathematical and statistical SQL operations
* Extract insights from cryptocurrency transaction history
* Work with real-world financial data using PostgreSQL
* Produce clean, accurate, well-tested queries under strict evaluation criteria

---

