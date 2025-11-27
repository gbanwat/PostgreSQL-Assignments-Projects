---

# 🧹 SQL Assignment 7 — Data Cleaning & Preparation (Data Scientist Salaries Dataset)

This repository contains my submission for **DTSC660 – Data and Database Management with SQL (Module 8, Assignment 7)**.
This assignment focuses on cleaning, standardizing, and preparing the **Data Scientist Salaries** dataset from Kaggle using PostgreSQL-based data wrangling techniques. 

---

## 📘 Overview

The goal of this assignment is to import the *Data Scientist Salaries* dataset and perform a series of SQL cleaning operations to make the data consistent, accurate, and ready for analysis.
Students load the CSV file, examine the table structure, create backups, address missing or inconsistent values, standardize categorical fields, and apply an additional cleaning technique of their choice.

The assignment consists of **one SQL file** containing table creation, data import, all transformations, and explanatory comments describing the rationale behind each cleaning decision.

---

## 📂 Included File

### **`Banwat_Assignment7.sql`**

This SQL file includes:

* A full `CREATE TABLE` statement tailored to the **Data Scientist Salaries** dataset
* The `COPY` command used to import the Kaggle CSV file
* A verification query to confirm that data loaded correctly
* All seven required data-cleaning steps
* Clear comments explaining why each transformation was applied
* PostgreSQL-compliant syntax designed to run in pgAdmin and CodeGrade
* A top comment block including:

  * Student name
  * Dataset chosen (**Data Scientist Salaries**)
  * Reason for choosing this dataset (e.g., interest in tech salaries, career relevance, structured dataset)

---

## 🧩 Part 1 — Table Creation & Data Import

Before cleaning the dataset, the following steps were completed:

* Downloaded the **Data Scientist Salaries** CSV from the Assignment 7 folder
* Placed the dataset into a public directory and copied its file path
* Created a SQL table matching the dataset’s structure, including fields such as:

  * `work_year`, `experience_level`, `employment_type`, `job_title`,
  * `salary`, `salary_currency`, `employee_residence`, `company_location`,
  * `company_size`, etc.
* Imported the dataset using PostgreSQL’s `COPY` command
* Verified correctness via:

  ```sql
  SELECT * FROM data_scientist_salaries LIMIT 5;
  ```
* Ensured column structure, data types, and row counts matched the original CSV

These steps ensure the grader can reproduce the same table structure when testing queries.


---

## 🧼 Part 2 — Data Cleaning Procedures

The SQL file includes solutions to all required cleaning tasks, tailored to the **Data Scientist Salaries** dataset:

* **Creating a backup table** to preserve the original dataset
* **Adding a duplicate column** for controlled transformation
* **Fixing missing data** in one column—using one of the following:

  * Converting placeholder values to `NULL`,
  * Replacing with an appropriate substitute (such as median salary or mode of experience level), or
  * Removing affected rows
* **Applying a different missing-data strategy** on a second column
* **Standardizing inconsistent categories**, such as:

  * `"SE"`, `"Senior"`, `"Sr"` → standardized to `"Senior"`
  * company size labels (`S`, `M`, `L`) made consistent or expanded
* **Repeating value standardization** on another field (e.g., job titles or employment types)
* **Applying one additional cleaning method**, such as:

  * Normalizing currency codes
  * Converting experience level abbreviations (`EN`, `MI`, `SE`, `EX`) to full text
  * Removing duplicate salary records
  * Trimming whitespace or fixing capitalization
  * Converting text-based numeric fields to proper numeric types

Each cleaning operation includes a detailed comment explaining *why* the step improves data quality and *how* it enhances downstream analytical usability.

---

## ✔️ Key Requirements Followed

* PostgreSQL-only syntax
* `CREATE TABLE` and `COPY` commands included exactly as required
* Every step labeled clearly with comments
* Rationale comments included for steps 3–7
* File named using the correct convention: `LastName_Assignment7.sql`
* SQL executes fully in pgAdmin without errors
* Dataset preparation tailored to the **Data Scientist Salaries** CSV
* No extraneous or malformed SQL included

---

## 🎯 Purpose

This assignment demonstrates the ability to:

* Import and structure a Kaggle dataset using PostgreSQL
* Clean and normalize real-world salary data
* Handle missing, inconsistent, or duplicate values strategically
* Standardize categorical fields for better analytical accuracy
* Apply multiple data-cleaning approaches from course modules
* Clearly document transformations and the reasoning behind them

---

