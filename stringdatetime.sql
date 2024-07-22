use booksandbooks;
SELECT * FROM books;
SELECT REPLACE(title, 'e ', '->') AS title FROM books;
SELECT 
    author_lname AS forwards, REVERSE(author_lname) AS backwards
FROM
    books;
SELECT 
    UCASE(CONCAT(author_fname, ' ', author_lname)) AS author_name
FROM
    books;
SELECT 
    CONCAT(title,
            ' was released in ',
            released_year) AS BLURB
FROM
    BOOKS;  
SELECT 
    TITLE, CHAR_LENGTH(TITLE)
FROM
    BOOKS;   
SELECT 
    CONCAT((SUBSTR(TITLE, 1, 10)), '...') AS SHORT_TITLE,
    CONCAT(AUTHOR_LNAME, ',', AUTHOR_FNAME) AS AUTHOR,
    CONCAT(STOCK_QUANTITY, ' IN STOCK') AS QUANTITY
FROM
    BOOKS;
select distinct stock_quantity from books;

-- DATE AND TIME DATA TYPE:
USE contacts;
CREATE TABLE people (
	name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME -- both date and time included in the from of mm/dd/yyyy hh.mm.ss:
);
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');
SELECT * FROM people;
SELECT CURTIME(); -- current time :
SELECT CURDATE();-- current date:
SELECT NOW(); -- current date and time:
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Hazel', CURDATE(), CURTIME(), NOW());
-- DATE FUNCTIONS:
SELECT 
    birthdate,
    DAY(birthdate),
    DAYOFWEEK(birthdate),
    DAYOFYEAR(birthdate)
FROM people;
SELECT 
    birthdate,
    MONTHNAME(birthdate),
    YEAR(birthdate)
FROM people;
-- TIME FUNCTIONS:
SELECT 
    birthtime,
    HOUR(birthtime),
    MINUTE(birthtime)
FROM people;
 SELECT 
    birthdt,
    MONTH(birthdt),
    DAYname(birthdt),
    HOUR(birthdt),
    SECOND(birthtime),
    MINUTE(birthdt)
FROM people;
SELECT birthdate, DATE_FORMAT(birthdate, '%a %b %D') FROM people; -- %a- dayname abbr %b- monthname abbr %D- date +th:
 
SELECT birthdt, DATE_FORMAT(birthdt, '%H:%i') FROM people; -- %H hour %i minute:
 
SELECT birthdt, DATE_FORMAT(birthdt, 'BORN ON: %r') FROM people; -- %r full time with am /pm:
-- DATE MATHS:
USE contacts;
SELECT DATEDIFF(CURDATE(),birthdate) FROM people;
SELECT DATE_ADD(CURDATE(),INTERVAL 1 YEAR);
SELECT DATE_SUB(CURDATE(),INTERVAL 1 YEAR);
SELECT birthdate,DATE_ADD(birthdate,INTERVAL 18 YEAR) FROM people;
-- TIME MATHS FUNCTIONS ARE:TIMEDIFF,TIMEADD,TIMESUB:
SELECT TIMEDIFF(birthtime,'07:56:45') FROM people;
SELECT name,birthdate,birthdate+INTERVAL 21 YEAR FROM people;
CREATE TABLE captions (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP
);
INSER
 
CREATE TABLE captions2 (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP,
  updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);    
    
    
    
    
    
    
    
    
    
    
    