# Database-Laboratory

This repository contains the solved exercises for a 10-part MySQL database laboratory. The scripts are written and tested for **MySQL 5.7** and cover a wide range of database concepts, from basic DDL/DML operations to advanced topics like triggers, stored procedures, and transactions.

## Theoretical Concepts Covered

* **Lab 1: Basic Queries (CREATE, INSERT, DELETE, UPDATE)**
    * Focuses on creating databases and tables, defining Primary and Foreign Keys, and understanding basic data manipulation[cite: 236, 246].
* **Lab 2: Virtual Columns and CHECK Constraints**
    * Introduces `GENERATED ALWAYS AS` for creating virtual columns that calculate data on the fly (e.g., profit = value - cost)[cite: 265, 268].
    * Explores data validation using `CHECK` constraints (Note: MySQL 5.7 parses CHECK constraints but functionally ignores them unless emulated with triggers; syntax is provided for educational purposes)[cite: 271].
* **Lab 3 & 4: Triggers and REGEXP**
    * Demonstrates how to use `BEFORE INSERT` and `BEFORE UPDATE` triggers to enforce strict data integrity rules, automate date insertion, and calculate values based on other fields (e.g., birth year from a CNP)[cite: 316, 319, 330].
    * Lab 4 heavily relies on Regular Expressions (`REGEXP`) inside triggers to validate complex string patterns like emails, specific CNP formats, and name constraints[cite: 334, 344].
* **Lab 5, 6 & 7: Advanced SELECT Queries**
    * Utilizes the `l7` database schema[cite: 413].
    * Covers filtering with the `WHERE` clause (`LIKE`, `IN`, `BETWEEN`, `RLIKE`)[cite: 397].
    * Explores data aggregation using `GROUP BY`, `HAVING`, and aggregate functions (`SUM`, `COUNT`, `AVG`)[cite: 519, 551].
    * Demonstrates combining data from multiple tables using `INNER JOIN`, `LEFT JOIN`, `NATURAL JOIN`, and `UNION`[cite: 490, 498, 500, 510].
* **Lab 8: Built-in Functions and Schema Alteration**
    * Applies math, string, and date functions (`CONCAT`, `TRUNCATE`, `ROUND`, `DATE_ADD`, `DATEDIFF`)[cite: 570].
    * overs modifying existing schemas using `ALTER TABLE` (adding/dropping columns, changing constraints)[cite: 577].
* **Lab 9: Stored Procedures**
    * Introduces reusable routines in the database using `CREATE PROCEDURE` for inserting, updating, deleting, and conditionally displaying data[cite: 593].
* **Lab 10: Transactions and Privileges**
    * Explores ACID properties using `START TRANSACTION`, `COMMIT`, `ROLLBACK`, and `SAVEPOINT` to manage concurrent data changes safely[cite: 622].
    * Covers MySQL user management, including granting and revoking privileges[cite: 674].

## Setup Instructions

1.  Start by running the `Lab1.sql` through `Lab4.sql` scripts individually to understand DDL, Constraints, and Triggers.
2.  Before running Labs 5 through 10, execute the `l7.sql` script. [cite_start]This establishes the base database schema and populates it with the necessary dummy data required for the `SELECT`, `JOIN`, and `PROCEDURE` queries[cite: 397, 413, 415].
