-- CONSTRAINTS:
-- UNIQUE CONSTRAINT:
CREATE DATABASE contacts;
use contacts;
CREATE TABLE contact (
    name VARCHAR(100) NOT NULL,
    phone_no VARCHAR(15) NOT NULL UNIQUE
);
INSERT INTO contact(name,phone_no)
VALUES
('ANURAG JAISWAL','8102568081'),
('AMISHA CHOUDHARY','9309569984'),
('RAJESH SUMAN','7061154396'),
('MIRA JAISWAL','7488513313');
SELECT * FROM contact;
-- CHECK CONSTRAINT:
CREATE TABLE partiers(
name VARCHAR(50),
age INT CHECK(age>18)
);
INSERT INTO partiers
VALUES
('SANDEEP',19); -- AGE agar kam dalenge to error aa jayega:
-- PALINDROME CHECK:
SELECT REVERSE('HELLO');
CREATE TABLE palindrome(
word varchar(20) CHECK (REVERSE(word)=word)
);
insert into palindrome (word) values
('racecar');
select * from palindrome;
CREATE TABLE users2 (
    username VARCHAR(20) NOT NULL,
    age INT,
    CONSTRAINT age_not_negative CHECK (age >= 0)
);
CREATE TABLE palindromes2 (
  word VARCHAR(100),
  CONSTRAINT word_is_palindrome CHECK(REVERSE(word) = word)
);
insert into palindromes2(word) values('mom');
select * from palindromes2;
 
-- NAMED CONSTRAINT: we can assign a name to a constraint :
create table users2(
  name varchar(20),
  age int
  constraint age_not_negative check(age>=0)
);
insert into users2(name,age) values('amisha',-2); -- check constraint is violated:
insert into users2(name,age) values('amisha',2);
select * from users2;
CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name , address) -- combination of name and address must be unique:
);
INSERT INTO companies(name,address) values
('amsiha','pal bagan'),
('anurag','pal bagan');
select * from companies;
CREATE TABLE houses (
  purchase_price INT NOT NULL,
  sale_price INT NOT NULL,
  CONSTRAINT sprice_gt_pprice CHECK(sale_price >= purchase_price)
);
insert into houses(purchase_price,sale_price) values
(300,450); -- check constraint is violated:
select * from houses;
-- ALTER TABLE:
-- ADD COLUMN:
ALTER TABLE companies
ADD phone varchar(15) not null default 1;
-- DROP COLUMN:
ALTER table companies
drop phone;
-- RENAME TABLE NAME AND COLUMN NAME:
RENAME TABLE companies to suppliers; -- 1st way of renaming a table :
select * from suppliers;
ALTER TABLE suppliers -- 2nd way of renaming table name:
rename companies;
select * from companies;
ALTER TABLE companies
RENAME COLUMN name TO company_name;
-- MODIFY COLUMN:to change column name's datatype and constraint:
alter table companies
modify column company_name varchar(100) not null default 'unknown';
desc companies;
-- CHANGE COLUMN NAME:
ALTER TABLE companies
CHANGE company_name name varchar(150); -- first write current column name,then new col name and then its new definition:
-- ALTER CONSTRAINT:
ALTER TABLE houses 
ADD CONSTRAINT positive_pprice CHECK (purchase_price >= 0);
ALTER TABLE houses DROP CONSTRAINT positive_pprice;

