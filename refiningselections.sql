select * from books;
select author_fname from books where author_fname not like '%o%';
select author_lname,released_year,title from books
order by author_lname asc, released_year desc;
select * from books 
order by released_year
limit 7;
select * from books
order by released_year
limit 1,3;
select * from books 
limit 0,5;
select * from books 
where author_fname like '%da%';   /*the % sign represents some character before after the string*/
/* '_____' -the underscore represents the number of character it has like if we have 4 underscore ,
it will give the output of matching exactly 4 string characters*/
select * from books where author_fname like '____';
select * from books where author_fname like '_a_';
/* what if I'm searching for a row or col with a '%' or '_' in it?*/
-- answer: where col_name ='%\%%' or '%\_%'(use backslash and then the % or _ sign!):
select title from books where title like '%stories%';
select title,pages from books 
order by pages desc
limit 0,1;
select ucase(concat(title,'-',released_year)) 
as summary 
from books
order by released_year desc
limit 0,3;
select title , author_lname from books 
where  author_lname like '% %';
select title , stock_quantity from books 
order by stock_quantity 
limit 0,3;
select  author_lname,title  from books
order by author_lname,title;
select ucase(concat('My favorite author is ',author_fname,' ',author_lname,'!')) as yell from books;









