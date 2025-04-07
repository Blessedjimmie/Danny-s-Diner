CREATE DATABASE dannys_diner;
USE dannys_diner;

CREATE TABLE sales (
customer_id VARCHAR(1),
  order_date DATE,
  product_id INT
);

INSERT INTO sales
  (customer_id, order_date, product_id)
VALUES
  ('A', '2021-01-01', '1'),
  ('A', '2021-01-01', '2'),
  ('A', '2021-01-07', '2'),
  ('A', '2021-01-10', '3'),
  ('A', '2021-01-11', '3'),
  ('A', '2021-01-11', '3'),
  ('B', '2021-01-01', '2'),
  ('B', '2021-01-02', '2'),
  ('B', '2021-01-04', '1'),
  ('B', '2021-01-11', '1'),
  ('B', '2021-01-16', '3'),
  ('B', '2021-02-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-07', '3');
 

CREATE TABLE menu (
  product_id INTEGER,
  product_name VARCHAR(5),
  price INTEGER
);

INSERT INTO menu
  (product_id, product_name, price)
VALUES
  ('1', 'sushi', '10'),
  ('2', 'curry', '15'),
  ('3', 'ramen', '12');
  

CREATE TABLE members (
  customer_id VARCHAR(1),
  join_date DATE
);

INSERT INTO members
  (customer_id, join_date)
VALUES
  ('A', '2021-01-07'),
  ('B', '2021-01-09');
 SELECT * FROM sales;
 SELECT * FROM menu;
 SELECT * FROM members;
-- What is the total amount each customer spent at the restaurant?
select customer_id, sum(price) as total_spent from sales
join menu on sales.product_id = menu.product_id
group by customer_id;
-- How many days has each customer visited the restaurant?
select customer_id, count(distinct order_date) as days_visited from sales
group by customer_id;
-- What was the first item from the menu purchased by each customer?
select product_name, customer_id, min(order_date) as first_item_purchased from sales
join menu on sales.product_id = menu.product_id
group by customer_id, product_name
order by first_item_purchased, customer_id;
-- What is the most purchased item on the menu and how many times was it purchased by all customers?
select product_name, customer_id, count(*) as item_purchased from sales
join menu on sales.product_id = menu.product_id
group by customer_id, product_name
order by item_purchased, customer_id;
-- Which item was the most popular for each customer?
select product_name, customer_id, count(*) as item_purchased from sales
join menu on sales.product_id = menu.product_id
group by customer_id, product_name
order by item_purchased, customer_id;
-- Which item was purchased first by the customer after they became a member?
select sales.customer_id, menu.product_name, max(sales.order_date) as first_purchase from sales
join members on sales.customer_id = members.customer_id
join menu on sales.product_id = menu.product_id
where sales.order_date >= members.join_date
group by sales.customer_id, menu.product_name limit 2;
-- Which item was purchased just before the customer became a member?
select sales.customer_id, menu.product_name, min(sales.order_date) as first_purchase from sales
join members on sales.customer_id = members.customer_id
join menu on sales.product_id = menu.product_id
where sales.order_date <= members.join_date
group by sales.customer_id, menu.product_name limit 2;
-- What is the total items and amount spent for each member before they became a member?
select sales.customer_id, count(product_name) as first_purchase from sales
join members on sales.customer_id = members.customer_id
join menu on sales.product_id = menu.product_id
where sales.order_date >= members.join_date
group by sales.customer_id, menu.product_name limit 2




 



