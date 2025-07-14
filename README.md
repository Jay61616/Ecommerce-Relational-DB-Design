# 🛒 ecommerce-relational-db-design

This project simulates the backend data architecture of an Amazon-like e-commerce platform. It includes a normalized relational database schema, stored procedures for business logic, and sample queries to extract insights — all written in  PL/SQL.

> 🎯 Ideal for showcasing relational modeling, procedural SQL, and query writing skills.

---

## 🛠️ Technologies Used

![Oracle SQL](https://img.shields.io/badge/SQL-Oracle-blue?logo=oracle)
![Relational DB](https://img.shields.io/badge/Database-3NF%20Relational%20Model-green)
![PL/SQL](https://img.shields.io/badge/PL--SQL-Stored%20Procedures-lightgrey)
![Data Modeling](https://img.shields.io/badge/ERD-Normalized%20Schema-purple)

---

## ✍️ Overview

The database models a typical online marketplace with the structural business rules:
- A Seller can sell many products
- A product is sold by a single seller
- Each product belongs to a category
- A product belongs to single category.
- A category can have many products.
- Product should have category ID, Name, Price, Quantity.
- An inventory belongs to single seller.
- A seller can have a single inventory.
- A customer can place many orders.
- An order belongs to a single customer.
- Customer should have username, address, phone number and email address.
- An order can have many products.
- A product belongs to a single order.
- Order should belong to a particular shipping speed.
- A return request belongs to one and only customer.
- A customer can have zero to many return requests.
- Return request should have Person ID and Product ID.
- A customer can have zero to many customers service request.
- A customer service request belongs to one and only one customer.
- Each order should have a tracking ID.
- A product list belongs to only one order.
- A order list has many order to product pairs.

---

## 📊 Database Structure

The schema is based on **3rd Normal Form (3NF)** and includes:

- `person`: Base user table for sellers and buyers
- `seller`, `buyer`: Specialized user roles
- `products`, `prod_category`, `inventory`: Product catalog and stock management
- `orders`, `orders_list`, `shipping`: Order processing and fulfillment
- `returns`, `customer_service`: Post-order operations

This is viasually represented by the image below:
![1](https://github.com/user-attachments/assets/59e95a9d-7878-469d-97bd-08612dbd6d6d)

Stored procedures are provided for:
- Inserting entities (e.g., `ADD_PRODUCTS`, `ADD_PERSON`)
- Updating status (e.g., `update_orders`, `update_returns`)

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
   This was a school project I answered few sample quetions asked by my professor. These are the questions:

✔️ Retrieve all products under $30 in either the 'Computers' or 'Electronics' category.
  ```sql
SELECT * FROM products
WHERE price < 30 AND (category_name = 'Computers' OR category_name = 'Electronics');
![2](https://github.com/user-attachments/assets/873b9381-651a-4eca-b2e8-d1a389277f76)
```
![2](https://github.com/user-attachments/assets/3ff6c318-fc54-4e82-80cf-287bffba9666)

✔️ List the names of products whose inventory count is 11 or less.
```sql
SELECT prod_name FROM products
JOIN inventory ON products.product_id = inventory.product_id
WHERE inventory.product_count <= 11;
![3](https://github.com/user-attachments/assets/63a436c9-d8c1-453a-9d2e-e1b4e0ee3133)
```
![3](https://github.com/user-attachments/assets/f710cf01-8a23-43fb-b4b2-f25d10def5e7)

✔️ Find all last names that appear more than 3 times in the person table.
```sql
SELECT lastname, COUNT(*) FROM person
GROUP BY lastname
HAVING COUNT(*) > 3;
```
![4](https://github.com/user-attachments/assets/45b46d2a-3af0-4b74-a073-b3dc46f5905d)

✔️ Retrieve buyer information for orders that include products purchased three or more times.
```sql
SELECT orders.person_id, person.firstname, person.lastname, person.address
FROM orders
INNER JOIN person ON orders.person_id = person.person_id
WHERE order_id IN (
    SELECT order_id FROM orders_list
    WHERE product_id IN (
        SELECT product_id FROM orders_list
        GROUP BY product_id
        HAVING COUNT(*) >= 3
    )
);
```
![5](https://github.com/user-attachments/assets/bacb31d6-01ae-434a-8b3e-d19cbd99e1aa)


✔️ Get shipping details for orders placed by customers with a Prime subscription.
```sql
SELECT shipping_id, status, service_provider FROM shipping
WHERE shipping_id IN (
    SELECT shipping_id FROM orders
    WHERE person_id IN (
        SELECT person_id FROM buyer
        WHERE subscription = 'prime'
    )
);
```
![6](https://github.com/user-attachments/assets/4b07c0cf-c46b-4295-9f4d-c7c07fcb4ac2)


## 👨‍💻 Author

Jaya Chandra Kadivati

SQL Developer | Data Engineering Enthusiast
