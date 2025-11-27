---

# 🗂️ SQL Database Queries (GitHub Dataset Analysis)

This repository contains my submission for **DTSC660 – Data and Database Management with SQL (Module 3, Assignment 2)**.
The assignment focuses on practicing SQL querying techniques using a large dataset scraped from GitHub.

## 📘 Overview

The goal of this assignment is to explore and analyze GitHub repository data by writing SQL queries that filter, sort, and extract meaningful insights.
The work builds on the foundation of Module 3 SQL concepts such as:

* Filtering (`WHERE`)
* Sorting (`ORDER BY`)
* Pattern matching (`LIKE` / `ILIKE`)
* Removing duplicates (`DISTINCT`)
* Range filtering
* Handling NULL values

The assignment uses a pre-provided dataset (`github_data.csv`) and a structured template in which all query outputs must be produced.

---

## 📂 Included File

### **`Banwat_Assignment2.sql`**

This SQL file contains:

* The complete set of **15 SQL queries** required for Assignment 2
* PostgreSQL-compliant syntax (`;` termination, correct table naming, standard functions)
* Queries executed against a table named **`github`**, as required for grading

---

## 🔧 Part 1 — Table Creation & Data Import (Setup)

Before writing the queries, the following steps were completed:

* Downloaded and stored the `github_data.csv` file
* Imported the file into PostgreSQL using the provided table-creation script
* Ensured the table name is exactly **`github`**
* Verified the imported dataset with a basic `SELECT * FROM github;`

This ensures all subsequent queries run correctly and match the structure expected by the grader.

---

## 🔍 Part 2 — Querying the GitHub Data

The SQL file includes solutions to all 15 required queries, such as:

* Returning all table data
* Listing distinct topics
* Sorting repositories by popularity
* Filtering repos by star counts, topic names, and username patterns
* Identifying repos with large star counts
* Searching links using case-insensitive matching
* Working with NULL values
* Producing alphabetical sorted lists without duplicates

Each query follows PostgreSQL conventions and is written to produce accurate, non-extraneous results.

---

## ✔️ Key Requirements Followed

* **Correct table name:** `github`
* **All queries end with semicolons**
* **No non-PostgreSQL syntax**
* **Queries produce correct rows only (no extra rows)**
* **Extraneous columns minimized unless allowed**
* Fully compatible with CodeGrade auto-grading

---

## 🎯 Purpose

This assignment demonstrates:

* Applying SQL filtering and searching techniques
* Understanding a real-world, messy dataset
* Building strong querying habits for analytics
* Ensuring precision and correctness under strict grading rules

---

