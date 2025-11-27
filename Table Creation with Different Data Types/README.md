---

# 📘 SQL Assignment – Database & Table Creation (Auto Parts Unlimited & Holy Grounds)

This repository contains my submission for **DTSC660 – Data and Database Management with SQL (Module 2, Assignment 1)**.
The assignment focuses on designing and implementing database structures using **PostgreSQL**, following strict data-type and formatting requirements.

## 📂 Overview

The objective of this assignment is to simulate database creation for two separate small-business clients.
Each client receives their own database and a set of tables built according to detailed business rules, field specifications, and data-validation needs.

Two `.sql` files are included, each corresponding to a different client:

---

## 🔧 File 1 — `Banwat_Assignment1_APU.sql`

### **Client: Auto Parts Unlimited**

This file contains:

* Creation of the `auto_parts_unlimited` database
* SQL commands to build **three tables**, each with carefully selected PostgreSQL data types:

  * **Customers**

    * Auto-generated numeric ID
    * Personal and contact details
  * **Employees**

    * Auto-generated employee ID
    * Full name, contact info, hire date, salary, and probationary status
  * **Parts Inventory**

    * Alphanumeric part number
    * Manufacturer, quantity in stock, price, and backorder status

Data types follow PostgreSQL standards (e.g., `serial`, `varchar(n)`, `numeric(p,s)`, `boolean`, etc.).

---

## 🔧 File 2 — `Banwat_Assignment1_HG.sql`

### **Client: Holy Grounds Coffee Shop**

This file contains:

* Creation of the `holy_grounds` database
* SQL commands to build **three tables**:

  * **Coffee Inventory**

    * SKU, roast type, pounds on hand, organic/low-acid flags, price per lb
  * **Sales Transaction**

    * Large-range auto-assigned receipt ID
    * Sale amount, sale type, transaction timestamp
  * **Store**

    * Auto-generated store ID
    * Manager name, phone number, location details

All fields adhere to the assignment’s strict data-type constraints for numeric, monetary, character, boolean, and timestamp values.

---

## ✔️ Key Requirements Followed

* PostgreSQL-compliant syntax
* Proper use of allowed data types
* Field lengths and numeric precision selected to reflect real-world constraints
* Phone number and state formatting requirements incorporated
* No added constraints beyond assignment scope
* All table-creation statements run sequentially without errors in pgAdmin

---

## 📑 Purpose

This assignment demonstrates:

* Best-practice schema design
* Thoughtful data-type selection
* Ability to read and apply client-level business requirements
* Creation of clean, maintainable SQL structures

---
