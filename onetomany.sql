/* RELATIONSHIPS BASICS:
1.ONE TO ONE     2.ONE TO MANY   3.MANY TO MANY */
-- ONE TO MANY RELATIONSHIP-The most common relatinship:
create database shop;
use shop; 
-- FOREIGN KEY:
CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
    on delete cascade
);
-- ON DELETE CASCADE: if anything is deleted from orders table,it will get deleted from customers table:
drop table customers,orders;
show tables;
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
select * from customers;
INSERT INTO orders (order_date, amount,customer_id)
VALUES ('2016-02-10', 99.99,1 ),
       ('2017-11-11', 35.50 ,1),
       ('2014-12-12', 800.67,2),
       ('2015-01-03', 12.50,2),
       ('1999-04-11', 450.25,5);
-- CROSS JOIN:
SELECT * FROM orders
WHERE customer_id = (SELECT id FROM customers
WHERE last_name = 'George');
select * from orders,customers; 
-- INNER JOINS:we get the overlap or intersection part as the result:
use shop;
SELECT * FROM customers
JOIN orders ON orders.customer_id=customers.id; -- we have to tell where the joining is happening:
select first_name,last_name,order_date,sum(amount) as total
from customers
join orders on customers.id=orders.customer_id
group by first_name,last_name,order_date
order by total;
-- LEFT JOIN:we get all the results from left table:
SELECT * FROM customers
left JOIN orders ON orders.customer_id=customers.id;
SELECT 
    order_date, amount, first_name, last_name
FROM
    orders
        LEFT JOIN
    customers ON orders.customer_id = customers.id;
-- IFNULL(SUM(AMOUNT),0):
SELECT 
    first_name,last_name,IFNULL(SUM(amount),0) 
FROM customers
		LEFT JOIN
orders ON orders.customer_id = customers.id
GROUP BY first_name , last_name;
SELECT 
    first_name, last_name, order_date, amount
FROM
    customers
        RIGHT JOIN
    orders ON customers.id = orders.customer_id;
-- ASSSIGNMENT:
create database essay;
use essay;
CREATE TABLE students(
   id INT AUTO_INCREMENT PRIMARY KEY,
   first_name VARCHAR(50)
);
CREATE TABLE papers(
   title VARCHAR(100),
   grade INT,
   student_id INT ,
   FOREIGN KEY(student_id) REFERENCES students(id)
   ON DELETE CASCADE
);
INSERT INTO students(first_name)
VALUES
('Caleb'),('Samantha'),('Raj'),('Carlos'),('Lisa');
INSERT INTO papers(student_id,title,grade)
VALUES
(1,'My First Book Report',60),
(1,'My Second Book Report',75),
(2,'Russian Lit Through The Ages',94),
(2,"De Montaigne and the Art of the Essay",98),
(4,'Borges and Magical Realism',89);
SELECT first_name,title,grade FROM students
JOIN papers ON students.id=papers.student_id
ORDER BY grade DESC;
SELECT first_name,title,grade FROM students
LEFT JOIN papers ON students.id=papers.student_id;
SELECT 
    first_name,
    IFNULL(title, 'MISSING') AS title,
    IFNULL(grade, 0) AS grade
FROM
    students
        LEFT JOIN
    papers ON students.id = papers.student_id;
SELECT 
    first_name, IFNULL(AVG(grade), 0) AS average
FROM
    students
        LEFT JOIN
    papers ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;
SELECT 
    first_name,
    IFNULL(AVG(grade), 0) AS average,
    CASE
        WHEN AVG(grade) >= 75 THEN 'PASSING'
        ELSE 'FAILING'
    END AS passing_status
FROM
    students
        LEFT JOIN
    papers ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;




   
    
    
    







