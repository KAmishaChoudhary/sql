-- BASIC SQL CRREATING DATABASE:
create database college;
use college;
 SELECT DISTINCT CITY FROM STUDENT;
 select * FROM STUDENT where MARKS>75;
 select * from student where marks>=75 and grade="A";
 select * from STUDENT WHERE GRADE="A" OR GRADE="B" OR GRADE="C"
 order by ROLL_NO ASC; 
 select * FROM STUDENT WHERE MARKS between 70 AND 100;

 select * from student 
 order by grade asc;
 select city ,avg(marks)
 from student
group by city
order by avg(marks) desc;
update student
set marks=marks+1;
create table student(
 roll_no int primary key,
 name varchar(60) default 'unnamed',
 marks int not null default 30,
 grade varchar(50) default 'F',
 city varchar(50)
 );
 desc student;
 insert into student
 (roll_no,name,marks,grade,city)
 values
 (101,"ANIL",78,"C","PUNE"),
 (102,"BHUMIKA",93,"A","MUMBAI"),
 (103,"CHETAN",85,"B","MUMBAI"),
 (104,"DHRUV",96,"A","DELHI"),
 (105,"EMANUEL",12,"F","DELHI"),
 (106,"FARAH",82,"B","DELHI");
  insert into student
 (roll_no,city)
 values
 (107,'RANCHI');
select * FROM STUDENT;
 SELECT * FROM STUDENT limit 3,5;
 select ROLL_NO,NAME,grade,city,count(roll_no)
from student
where grade="A" OR GRADE="B" or grade="C"
group by ROLL_NO,NAME,grade,city
having max(marks)>50
order by roll_no;
update student
set roll_no=115
where roll_no=107;
insert into student 
(roll_no,name,marks,grade,city)
values
(107,'SANDEEEP',85,'B','DHANBAD'),
(108,'PRIYA',80,'B','JAMSHEDPUR'),
(109,'ASHUTOSH',73,'C','PATNA'),
(110,'POONAM',95,'A','BOKARO STEEL CITY');
insert into student 
(roll_no,name,marks,grade,city)
values
(111,'AMISHA\'S MOM',90,'A','JAMTARA');
Set sql_safe_updates=0;
UPDATE STUDENT
SET ROLL_NO=112
where MARKS=90;
create table student1(
college_id int auto_increment primary key,
name varchar(60),
score int not null,
CGPA INT NOT NULL
);
INSERT INTO STUDENT1
(NAME,SCORE,CGPA)
VALUES
('AMISHA',50,6),
('ANURAG',88,8);

select * FROM STUDENT1;
create table employee(
id int auto_increment primary key,
first_name varchar(50) not null,
middle_name varchar(50),
last_name varchar(50) not null,
age int not null,
current_status varchar(50) default "employed"
);
desc employee;
create database cats;
use cats;
create table cats1(
  cats_id int auto_increment primary key,
  name varchar(50),
  breed varchar(50),
  age int );
insert into cats1 (name,breed,age)
values
('RINGO','TABBY',4),
('CINDY','MAINE COON',10),
('DUMBLEDORE','MAINE COON',11),
('EGG','PERSIAN',4),
('MISTY','TABBY',13),
('GEORGE MICHAEL','RAGDOLL',9),
('JACKSON','SPHYNX',7);
SELECT name as kitty FROM CATS1;
select * from cats1;
create database shirt_db;
use shirt_db;
create table shirts(
  shirt_id int auto_increment primary key,
  article varchar(50),
  color varchar(20),
  shirt_size varchar(5),
  last_worn int);
insert into 
shirts(article,color,shirt_size,last_worn)
values
('t-shirt','white','S',10),
('t-shirt','green','S',200),
('polo shirt','black','M',10),
('tank top','blue','S',50),
('t-shirt','pink','S',0),
('polo shirt','red','M',5),
('tannk top','white','S',200),
('tank top','blue','M',15);
select * from shirts;
insert into shirts(article,color,shirt_size,last_worn)
values
('polo shirt','purple','M',50);
select article,shirt_size,color,last_worn from shirts
where shirt_size='m';
Set sql_safe_updates=0;
select article,shirt_size from shirts where article='polo shirt';
update shirts 
set shirt_size='L'
where article='polo shirt';
select * from shirts;
update shirts 
set last_worn=0
where last_worn=15;
select article,shirt_size,color from shirts
where color='white';
update shirts
set color='off white',shirt_size='XS'
where color='white';
select * from shirts;
delete from shirts where article='tank top';
drop table shirts;
show tables;
drop database shirt_db;
create database booksandbooks;
use booksandbooks;
create table books(
  book_id INT AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
        );
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

SELECT CONCAT(author_fname,' ', author_lname) AS author_name FROM books;
 
SELECT CONCAT_WS('-',title, author_fname, author_lname) FROM books;
show databases;
use booksandbooks;
ALTER TABLE books
ADD genre varchar(50);
INSERT INTO books(genre) 
VALUES
('Modern Clit');
select * from books;















