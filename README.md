# Restaurant Management Database System

## Project Overview

This project is a relational database system developed to manage the main operations of a restaurant. It organizes information about customers, staff, restaurant tables, menu products, orders, reservations, invoices, and payments.

The database was developed using **Microsoft SQL Server** and managed through **SQL Server Management Studio (SSMS)**. The project demonstrates fundamental database design principles and SQL querying techniques.

## Data Disclaimer

**All data used in this project is fictional and was created solely for educational and demonstration purposes.**

Customer names, employee names, phone numbers, email addresses, reservations, orders, salaries, and payment records are sample data. They are not intended to represent verified real individuals, actual employees, or real restaurant transactions.

Any resemblance to real persons or existing information is purely coincidental. No real customer or employee data was intentionally used in the development of this project.

## Project Objectives

- Design and implement a relational database for restaurant management.
- Store and organize customer and employee information.
- Manage restaurant tables, menu categories, and menu products.
- Record customer orders and their associated products.
- Manage restaurant reservations and payment records.
- Establish relationships between tables using primary keys and foreign keys.
- Retrieve meaningful information through SQL queries.
- Generate reports using joins, aggregate functions, grouping, and sorting.

## Technologies Used

- **Microsoft SQL Server** — relational database management system.
- **SQL Server Management Studio (SSMS)** — database development and management environment.
- **Transact-SQL (T-SQL)** — database creation, data insertion, and querying.
- **Git and GitHub** — source code version control and project presentation.

## Database Structure

The database contains nine tables:

| Table | Description |
|---|---|
| `KLIENTI` | Stores customer information, including names, phone numbers, and email addresses. |
| `STAFI` | Stores employee information, roles, contact details, and salaries. |
| `TAVOLINA_RESTORANT` | Stores restaurant table numbers, seating capacities, and statuses. |
| `KATEGORIA_MENU` | Stores menu categories, such as food, alcoholic drinks, non-alcoholic drinks, and desserts. |
| `PRODUKTE_MENU` | Stores menu products, their categories, and prices. |
| `POROSI` | Stores customer orders, associated employees, restaurant tables, dates, and statuses. |
| `REZERVIM` | Stores customer reservations and their scheduled dates and times. |
| `FATURA` | Stores invoice line items, including products, quantities, and prices associated with orders. |
| `PAGESA` | Stores payment information, including amounts, payment methods, and dates. |

## Database Relationships

The database uses primary keys, foreign keys, unique constraints, and default constraints to organize data and maintain referential integrity.

The main relationships include:

- **Customers and Orders:** A customer can place multiple orders.
- **Employees and Orders:** An employee can handle multiple orders.
- **Restaurant Tables and Orders:** A restaurant table can be associated with multiple orders over time.
- **Menu Categories and Products:** A category can contain multiple menu products.
- **Orders and Invoice Items:** An order can contain multiple invoice line items.
- **Menu Products and Invoice Items:** A menu product can appear in multiple invoice line items.
- **Orders and Payments:** Each order can have at most one payment record, enforced by a unique constraint on `PAGESA.POROSI_ID`.
- **Customers and Reservations:** A customer can make multiple reservations.
- **Restaurant Tables and Reservations:** A table can be associated with multiple reservations at different times.

Foreign key constraints help ensure that related records reference existing customers, employees, tables, orders, categories, and products.

## SQL Queries and Functionality

The project includes SQL queries that demonstrate common restaurant management and reporting tasks.

Examples include:

1. Retrieving all customer records.
2. Displaying menu products alongside their categories.
3. Displaying orders with customer and employee information.
4. Calculating the total value of each order from its invoice line items.
5. Displaying invoice details, quantities, unit prices, and line totals.
6. Identifying the top-selling products by quantity.
7. Calculating revenue by menu product.
8. Summarizing payments by payment method.
9. Identifying orders without a recorded payment.
10. Displaying reservations with customer and restaurant table details.
11. Counting orders handled by each employee.
12. Calculating average menu prices by category.
13. Counting orders by status.
14. Displaying restaurant tables, capacities, and statuses.
15. Retrieving customers who have placed orders.

These queries demonstrate the use of:

- `SELECT` statements
- `INNER JOIN` and `LEFT JOIN`
- Aggregate functions such as `SUM()`, `COUNT()`, and `AVG()`
- `GROUP BY` and `ORDER BY`
- `TOP` and `DISTINCT`
- Primary and foreign key relationships

## Project Structure

The repository is organized as follows:

```text
Restaurant-Management-Database/
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_insert_data.sql
│   └── 03_queries.sql
└── README.md
```

### File Descriptions

- **`01_create_tables.sql`** — creates the database tables, keys, relationships, and constraints.
- **`02_insert_data.sql`** — inserts fictional sample data into the database.
- **`03_queries.sql`** — contains SQL queries for retrieving information and generating reports.
- **`README.md`** — documents the project, database structure, and setup instructions.

## How to Run the Project

### Prerequisites

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)

### Installation and Execution

1. Open SQL Server Management Studio and connect to your SQL Server instance.
2. Open `01_create_tables.sql` and execute it to create the database structure.
3. Open `02_insert_data.sql` and execute it to insert the sample records.
4. Open `03_queries.sql` and execute individual query sections to explore the database and generate reports.

**Important:** Run the creation and insertion scripts in the correct order on a fresh database setup. Do not execute them again against a database that already contains the same tables and records, as this may cause object-exists or duplicate-key errors.

The scripts may need minor adjustments depending on the SQL Server instance and database configuration.

## Future Improvements

Possible extensions to this project include:

- Creating an Entity-Relationship Diagram (ERD).
- Adding views for frequently used reports.
- Creating stored procedures for common restaurant operations.
- Adding triggers or additional constraints where appropriate.
- Developing a simple application interface for managing orders, reservations, and payments.
- Improving reporting for revenue, sales performance, and employee activity.

## Conclusion

The Restaurant Management Database System demonstrates the design and implementation of a relational database for restaurant operations. It applies important database concepts, including relational modeling, primary keys, foreign keys, constraints, joins, aggregate functions, and data reporting.

The project provides a foundation for organizing restaurant information and analyzing orders, menu products, reservations, and payments. It was developed as an educational project to strengthen practical SQL and database management skills.
