# MySQL Research

## What is the Database and why does it exist?
A database is an electronically stored, systematic collection of data that can include words, numbers, images, videos, and other types of files.

managed using specialized software -> Database Management System (DBMS)

[reference](https://www.geeksforgeeks.org/what-is-database/)

## What is the SQL?
Stands for (Structured Query Language).

SQL is a standard language for accessing and manipulating databases.

[reference](https://www.w3schools.com/sql/sql_intro.asp)

## What are the most 5 famous DBs in the world now? and why?
1. **Oracle**: Data warehousing ..  gives flexibly and also it costs lesser.
2. **MySQL**: open-source and user-friendly. supported on both the client and server sides.
3. **Microsoft SQL Server**: supported on both the client and server sides, 
4. **PostgreSQL**: open-source, supports many advanced programming languages
5. **MongoDB**: open-source, It stores data in the form of a document and collections which means the data are not stored using rows and columns, much faster as compared to a relational database. 

[reference](https://www.geeksforgeeks.org/most-popular-databases/)

## What is RDBMS?
RDBMS stands for Relational Database Management System. It is a type of database management system (DBMS) that stores data using rows and columns in tables. The data in these tables are related to each other through keys, which allows for efficient querying and manipulation of the data. 

## RDBMS vs DBMS

| **Aspect**               | **DBMS**                                      | **RDBMS**                                     |
|--------------------------|-----------------------------------------------|-----------------------------------------------|
| **Definition**           | A software system for managing databases.    | A type of DBMS that stores data in tables with relationships. |
| **Data Storage**         | Data can be stored in files or hierarchical/network models. | Data is stored in tabular form (rows and columns). |
| **Data Relationship**    | No inherent support for relationships between data. | Supports relationships between tables using keys (primary and foreign keys). |
| **Scalability**          | Less scalable for large datasets.            | Highly scalable for large datasets.           |
| **Examples**             | File systems, XML databases, etc.            | MySQL, PostgreSQL, Oracle, SQL Server,    |
| **Query Language**       | May use proprietary query languages.         | Uses SQL (Structured Query Language).         |

# Naming Conventions in RDBMS
## 1. **Table Names**
- Use **singular nouns** (e.g., `User`, `Product`).
- Use **PascalCase** or **snake_case**.
- Examples: `Customer`, `OrderDetail`, `product_category`.

## 2. **Column Names**
- Use **snake_case** (e.g., `first_name`) or **camelCase** (e.g., `firstName`).
- Be descriptive and avoid random abbreviations.
- Examples: `email_address`, `lastName`.

## 3. **Primary Keys**
- Use `id` as the column name for the primary key.
- Example: `id` in the `User` table.

## 4. **Foreign Keys**
- Use the referenced table name + `_id`.
- Example: `user_id` in the `Order` table (references `User` table).

## 5. **Indexes**
- Start with `idx_` + table name + column name.
- Example: `idx_user_email` for an index on the `email` column in the `User` table.

## 6. **Constraints**
- Use prefixes like:
  - `pk_` for primary keys (e.g., `pk_user`).
  - `fk_` for foreign keys (e.g., `fk_order_user`).
  - `uk_` for unique keys (e.g., `uk_user_email`).
  - `ck_` for check constraints (e.g., `ck_age_positive`).

## 7. **Stored Procedures/Functions**
- Use prefixes:
  - `sp_` for stored procedures (e.g., `sp_get_user_details`).
  - `fn_` for functions (e.g., `fn_calculate_discount`).

## 8. **Views**
- Start with `vw_` + descriptive name.
- Example: `vw_customer_orders`.

## 9. **Database Name**
- Use **snake_case** or **camelCase**.
- Examples: `ecommerce_db`, `inventoryManagement`.
