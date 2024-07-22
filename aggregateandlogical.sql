-- AGGREGATE FUNCTIONS MODULE:
-- COUNT> how many rows in the database(it's a single value):
select count(*) from books;
select count(author_fname) from books;
select  count(distinct author_fname) from books;
select count(title) from books 
where title like '%the%';
-- GROUP BY> group by agregates or summarizes identical data into one single row:
select author_lname,count(author_lname)from books
group by author_lname
order by count(author_lname) desc;
-- MAX AND MIN>:
select min(released_year) from books;
select max(pages) from books;
-- SUBQUERIES> A query within a query:
SELECT * FROM books
WHERE pages=(SELECT MAX(pages) FROM books);
-- GROUPING BY MULTIPLE COLUMN:
SELECT author_lname,author_fname,count(*) FROM books
GROUP BY author_lname,author_fname
ORDER BY author_fname;
SELECT CONCAT(author_fname,' ',author_lname) AS author
FROM books
GROUP BY author;
-- MIN/MAX  WITH GROUP BY:
SELECT author_fname,author_lname,MIN(released_year)
FROM books
GROUP BY author_fname,author_lname;
-- SUM>:
SELECT author_fname,author_lname,SUM(pages)
FROM books
GROUP BY author_fname,author_lname;
-- AVG>:
-- CEIL(): Return the smallest integer value that is greater than or equal to the value:
-- FLOOR(): Return the largest integer value that is equal to or less than the value:
SELECT AVG(stock_quantity),released_year
FROM books
GROUP BY released_year;
SELECT FLOOR(AVG(stock_quantity)),released_year
FROM books
GROUP BY released_year;
-- ROUND UPTO DECIMAL:
select round(sum(lat_n),2),round(sum(long_w),2)
from station;
-- ASSIGNMENT:
SELECT COUNT(title) FROM books;
SELECT released_year , count(title) FROM books
GROUP BY released_year;
SELECT SUM(stock_quantity) FROM books;
SELECT AVG(released_year),author_fname,author_lname
FROM books
GROUP BY author_fname,author_lname;
SELECT AVG(released_year)
FROM books
GROUP BY author_fname,author_lname;
SELECT CONCAT(author_fname,' ',author_lname) AS author,pages
FROM  books
ORDER BY pages DESC 
LIMIT 1;
SELECT CONCAT(author_fname, ' ', author_lname) AS author, pages 
FROM books
WHERE pages = (SELECT MAX(pages) FROM books);
SELECT released_year, COUNT(title) AS book ,AVG(pages)
FROM books
GROUP BY released_year
ORDER BY released_year ; -- END OF ASSIGNMENT OF AGGREGATE FUNCTION:


-- LOGICAL OPERATORS MODULE:
-- AND OPERATOR:
SELECT * FROM books 
WHERE author_fname='Dave' && author_lname='Eggers' && released_year>2010;
SELECT title,pages FROM books 
WHERE CHAR_LENGTH(title)>15 && pages>400;
-- OR OPERATOR:
SELECT title,pages FROM books 
WHERE CHAR_LENGTH(title)>15 OR pages>400;
-- BETWEEN OPERATOR(used to short and operator):
SELECT title,released_year FROM books
WHERE released_year BETWEEN 2004 AND 2015;
SELECT title,released_year FROM books
WHERE released_year NOT BETWEEN 2004 AND 2015;
-- IN OPERATOR(used to short or operator):
SELECT title,author_lname FROM books
WHERE author_lname IN('lahiri','smith','carver');
SELECT title,author_lname FROM books
WHERE author_lname NOT IN('lahiri','smith','carver');
SELECT title,released_year FROM books
WHERE released_year NOT IN(2000,2002,2004,2006,2008,2010,2012,2014,2016,2018);
-- MODULO(REMAINDER) OPERATOR:
SELECT title ,released_year FROM books
WHERE released_year>=2000 AND released_year%2!=0;
-- CASE STATEMENT:
SELECT 
    title,
    released_year,
    CASE
        WHEN released_year >= 2010 THEN 'MODERN LIT'
        ELSE '20TH CENTURY LIT'
    END AS genre
FROM
    books;
SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS stock
FROM
    books;
SELECT * FROM books WHERE title IS NULL;
-- ASSIGNMENT:
SELECT * FROM books
WHERE released_year<1980;
SELECT * FROM books 
WHERE author_lname IN('Eggers','Chabon');
SELECT * FROM books 
WHERE author_lname='Lahiri' && released_year>2000;
SELECT * FROM books
WHERE pages BETWEEN 100 AND 200;
SELECT * FROM books 
WHERE author_lname LIKE 'C%'
OR author_lname LIKE 'S%';
SELECT title, author_lname FROM books
WHERE SUBSTR(author_lname, 1, 1) IN ('C' , 'S'); -- substr me jo 1,1 hai ,wo starting letter (indexing )represent karta hai:
SELECT 
    title,
    author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'short stories'
        WHEN title = 'Just kids' THEN 'Memoir'
        WHEN title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memoir'
        ELSE 'Novel'
    END AS type
FROM
    books;
SELECT author_fname,author_lname ,CONCAT(COUNT(author_fname),' books') AS COUNT
FROM books
GROUP BY author_fname,author_lname; -- END OF ASSIGNMENT:






