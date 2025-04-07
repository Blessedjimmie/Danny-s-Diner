# Danny's Diner - SQL Case Study

This repository contains the SQL queries and setup scripts for the Danny's Diner case study. This case study explores customer behavior at a fictional diner using a simple database schema.

## Database Schema

The database consists of three tables:

* **`sales`**: Contains information about individual customer orders, including the customer ID, order date, and the ID of the product ordered.
* **`menu`**: Details the items available on the diner's menu, including their product ID, name, and price.
* **`members`**: Records which customers are members of the diner's loyalty program and the date they joined.

### `Sales` Table

| Column        | Data Type   | Description                        |
|---------------|-------------|------------------------------------|
| `customer_id` | `VARCHAR(1)`| Unique identifier for the customer |
| `order_date`  | `DATE`      | Date when the order was placed     |
| `product_id`  | `INT`       | Foreign key referencing `menu`     |

### `menu` Table

| Column       | Data Type    | Description                    |
|--------------|--------------|--------------------------------|
| `product_id` | `INTEGER`    | Unique identifier for the item |
| `product_name`| `VARCHAR(5)` | Name of the menu item         |
| `price`      | `INTEGER`    | Price of the menu item         |

### `members` Table

| Column        | Data Type   | Description                            |
|---------------|-------------|----------------------------------------|
| `customer_id` | `VARCHAR(1)`| Unique identifier for the customer     |
| `join_date`   | `DATE`      | Date when the customer became a member |

## Setup Instructions

To run the queries in this repository, you will need a SQL database environment (e.g., MySQL, PostgreSQL, SQLite).

1.  **Create the Database:**
    Run the CREATE DATABASE dannys_diner; command.
2.  **Use the Database:**
    Run the USE dannys_diner; command.
3.  **Create Tables:**
    Execute the `CREATE TABLE` statements for `sales`, `menu`, and `members`.
4.  **Insert Data:**
    Execute the `INSERT INTO` statements to populate the tables with the provided sample data.

## Queries

This repository contains SQL queries to answer various business questions related to customer behavior at Danny's Diner. The queries cover:

* Calculating the total amount spent by each customer.
* Determining the number of days each customer visited the restaurant.
* Identifying the first item purchased by each customer.
* Finding the most purchased item overall.
* Determining the most popular item for each customer.
* Analyzing customer purchases before and after becoming a member.

You can find these queries within this file (or potentially in separate `.sql` files if the project grows). Each query is commented to explain its purpose.

## Learning Objectives

This case study provides an opportunity to practice and apply SQL skills in areas such as:

* Basic `SELECT` statements.
* Joining tables using `JOIN`.
* Aggregating data using `GROUP BY` and aggregate functions (`SUM`, `COUNT`, `MIN`, `MAX`).
* Using window functions (`ROW_NUMBER()`, `RANK()`, etc.) for more complex analysis.
* Filtering data using `WHERE` clauses.
* Ordering results using `ORDER BY`.
