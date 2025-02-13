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

(Reference)[https://www.geeksforgeeks.org/rdbms-full-form/]

## RDBMS vs DBMS

| **Aspect**               | **DBMS**                                      | **RDBMS**                                     |
|--------------------------|-----------------------------------------------|-----------------------------------------------|
| **Definition**           | A software system for managing databases.    | A type of DBMS that stores data in tables with relationships. |
| **Data Storage**         | Data can be stored in files or hierarchical/network models. | Data is stored in tabular form (rows and columns). |
| **Data Relationship**    | No inherent support for relationships between data. | Supports relationships between tables using keys (primary and foreign keys). |
| **Scalability**          | Less scalable for large datasets.            | Highly scalable for large datasets.           |
| **Examples**             | File systems, XML databases, etc.            | MySQL, PostgreSQL, Oracle, SQL Server,    |
| **Query Language**       | May use proprietary query languages.         | Uses SQL (Structured Query Language).         |

[Refernce](https://www.geeksforgeeks.org/difference-between-rdbms-and-dbms/)


## Naming Conventions in RDBMS
### 1. **Table Names**
- Use **singular nouns** (e.g., `User`, `Product`).
- Use **PascalCase** or **snake_case**.
- Examples: `Customer`, `OrderDetail`, `product_category`.

### 2. **Column Names**
- Use **snake_case** (e.g., `first_name`) or **camelCase** (e.g., `firstName`).
- Be descriptive and avoid random abbreviations.
- Examples: `email_address`, `lastName`.

### 3. **Primary Keys**
- Use `id` as the column name for the primary key.
- Example: `id` in the `User` table.

### 4. **Foreign Keys**
- Use the referenced table name + `_id`.
- Example: `user_id` in the `Order` table (references `User` table).

### 5. **Indexes**
- Start with `idx_` + table name + column name.
- Example: `idx_user_email` for an index on the `email` column in the `User` table.

### 6. **Constraints**
- Use prefixes like:
  - `pk_` for primary keys (e.g., `pk_user`).
  - `fk_` for foreign keys (e.g., `fk_order_user`).
  - `uk_` for unique keys (e.g., `uk_user_email`).
  - `ck_` for check constraints (e.g., `ck_age_positive`).

### 7. **Stored Procedures/Functions**
- Use prefixes:
  - `sp_` for stored procedures (e.g., `sp_get_user_details`).
  - `fn_` for functions (e.g., `fn_calculate_discount`).

### 8. **Views**
- Start with `vw_` + descriptive name.
- Example: `vw_customer_orders`.

### 9. **Database Name**
- Use **snake_case** or **camelCase**.
- Examples: `ecommerce_db`, `inventoryManagement`.

[Reference](https://www.coding-guidelines.lftechnology.com/docs/rdbms/rdbms-naming-convention/)


## Primary Keys vs. Unique Keys

In relational databases like MySQL, both primary keys and unique keys are used to enforce uniqueness in a table's columns, but they have distinct characteristics and purposes.

**Primary Key**:
- **Uniqueness**: Ensures that each row in a table is unique.
- **NULL Values**: Does not allow NULL values.
- **Number per Table**: Only one primary key is permitted per table.
- **Indexing**: Automatically creates a clustered index, which determines the physical order of data in the table.

**Unique Key**:
- **Uniqueness**: Ensures that the data in a column or a set of columns is unique across all rows.
- **NULL Values**: Allows one NULL value per column.
- **Number per Table**: Multiple unique keys can be defined in a table.
- **Indexing**: Creates a non-clustered index, which does not affect the physical order of data.

[Reference: Difference between Primary key and Unique key](https://www.geeksforgeeks.org/difference-between-primary-key-and-unique-key/).

## Constraints in MySQL

Constraints are rules enforced on data columns in a table to ensure the integrity and accuracy of the data. MySQL supports several types of constraints:

- **NOT NULL**: Ensures that a column cannot have a NULL value.
- **UNIQUE**: Ensures that all values in a column are unique.
- **PRIMARY KEY**: A combination of NOT NULL and UNIQUE. Uniquely identifies each row in a table.
- **FOREIGN KEY**: Ensures referential integrity by linking the values in one table to those in another.
- **CHECK**: Ensures that all values in a column satisfy a specific condition. (Note: As of MySQL 8.0.16, the CHECK constraint is parsed but ignored.)

[Reference: MySQL Constraints](https://www.w3schools.com/mysql/mysql_constraints.asp).

## Indexing in MySQL

Indexes are special data structures that improve the speed of data retrieval operations on a database table at the cost of additional storage space and potential performance overhead during data modification operations.

**Benefits of Indexing**:
- **Faster Query Performance**: Indexes allow the database to find data without scanning the entire table.
- **Efficient Sorting**: They help in quickly sorting the data.

**Types of Indexes in MySQL**:
- **Primary Key Index**: Automatically created when a primary key is defined.
- **Unique Index**: Ensures all values in the index are unique.
- **Full-Text Index**: Used for full-text searches.
- **Spatial Index**: Used for spatial data types.

It's important to use indexes judiciously, as they can slow down write operations like INSERT, UPDATE, and DELETE due to the overhead of maintaining the index structure.

[Reference: How MySQL Uses Indexes](https://dev.mysql.com/doc/en/mysql-indexes.html).


## Relations 

### One-to-One (1:1)
- In this type of relationship, a single record in Table A corresponds to a single record in Table B.
- Example: A user and a user profile table where each user has exactly one profile.
- Implemented using unique constraints or primary keys in both tables.

### One-to-Many (1:M)
- A record in Table A can be linked to multiple records in Table B, but each record in Table B is linked to only one record in Table A.
- Example: A customer placing multiple orders.
- Implemented using foreign keys where the primary key of Table A is referenced in Table B.

### Many-to-Many (M:N)
- A record in Table A can relate to multiple records in Table B, and vice versa.
- Example: Students enrolling in multiple courses, and courses having multiple students.
- Implemented using a junction table that contains foreign keys referencing both Table A and Table B.

[Reference](https://www.w3schools.com/sql/sql_foreignkey.asp)

---

## Write-Ahead Logging (WAL)

Write-ahead logging (WAL) is a database mechanism that ensures data integrity by writing changes to a log before applying them to the database.

### How It Works:
1. When a transaction modifies data, it is first written to a log file.
2. The database applies the changes from the log file to the actual database storage.
3. If a failure occurs, the database can recover by replaying the log.

### Benefits:
- Provides durability and atomicity (ACID properties).
- Speeds up database transactions since logs can be written sequentially before actual disk writes.
- Enables database recovery in case of a crash.

[Reference](https://www.postgresql.org/docs/current/wal-intro.html)

---

## Normalization vs. Denormalization

Normalization and denormalization are two techniques used in database design to optimize structure and performance.

### Normalization
- Process of organizing data to minimize redundancy and improve integrity.
- Involves dividing large tables into smaller ones and defining relationships.
- Common normal forms: 1NF, 2NF, 3NF, BCNF.
- Example: Storing customer addresses in a separate table instead of repeating them in every order.

### Denormalization
- The process of merging tables and introducing redundancy to improve read performance.
- Reduces the need for complex joins in queries.
- Used in analytical databases where speed is prioritized over data redundancy.
- Example: Storing customer addresses directly in the orders table to reduce joins.

### Differences:
| Feature          | Normalization | Denormalization |
|----------------|--------------|----------------|
| Redundancy     | Reduced      | Increased      |
| Query Speed   | Slower (more joins) | Faster (fewer joins) |
| Storage Efficiency | More efficient | Less efficient |
| Data Integrity | Higher       | Lower          |

[Reference](https://www.geeksforgeeks.org/normalization-vs-denormalization-in-dbms/)

