# 🛒 ecommerce-relational-db-design

This project simulates the backend data architecture of an Amazon-like e-commerce platform. It includes a normalized relational database schema, stored procedures for business logic, and sample queries to extract insights — all written in Oracle SQL.

> 🎯 Ideal for showcasing relational modeling, procedural SQL, and query writing skills.

---

## ✍️ Overview

The database models a typical online marketplace where:
- Sellers offer products across various categories
- Buyers place orders, which are fulfilled through shipping providers
- Returns and customer service requests are tracked
- Inventory is managed per seller-product relationship

---

## 📊 Database Structure

The schema is based on **3rd Normal Form (3NF)** and includes:

- `person`: Base user table for sellers and buyers
- `seller`, `buyer`: Specialized user roles
- `products`, `prod_category`, `inventory`: Product catalog and stock management
- `orders`, `orders_list`, `shipping`: Order processing and fulfillment
- `returns`, `customer_service`: Post-order operations

Stored procedures are provided for:
- Inserting entities (e.g., `ADD_PRODUCTS`, `ADD_PERSON`)
- Updating status (e.g., `update_orders`, `update_returns`)

---

## 🛠️ Technologies Used

![Oracle SQL](https://img.shields.io/badge/SQL-Oracle-blue?logo=oracle)
![Relational DB](https://img.shields.io/badge/Database-3NF%20Relational%20Model-green)
![PL/SQL](https://img.shields.io/badge/PL--SQL-Stored%20Procedures-lightgrey)
![Data Modeling](https://img.shields.io/badge/ERD-Normalized%20Schema-purple)

---

## 📁 Folder Structure

ecommerce-relational-db-design/
├── schema/
│ └── create_tables.sql # All CREATE TABLE statements
├── procedures/
│ ├── insert_procedures.sql # Stored procedures to insert data
│ └── update_procedures.sql # Stored procedures to update records
├── data/
│ └── insert_values.sql # Sample data loaded using procedures
├── queries/
│ └── aspect_queries.sql # Business insight queries with context
└── README.md # You're reading it 🙂


## 💻 How to Use

1. **Load the schema**
   [Create Tables](schema/create_tables.sql)
   
3. Create stored procedures
   [Insert Procedures](procedures/insert_procedures.sql)
   [Insert Procedures](procedures/update_procedures.sql)
   
5. Insert sample data
   [Insert Values](data/insert_values.sql)
   
7. Run business queries
   [Aspect Queries](queries/aspect_queries.sql)
⚠️ Note: This project is designed for Oracle SQL/PL-SQL environments (e.g., Oracle SQL Developer, AWS RDS with Oracle engine).

📌 Sample Business Questions Answered
✔️ What are the products under $30 in Electronics/Computers?
✔️ Who are the buyers with Prime membership and active orders?
✔️ Which product categories are most returned?
✔️ What is the most common customer service issue?

👨‍💻 Author
Jaya Chandra Kadivati
SQL Developer | Data Engineering Enthusiast
