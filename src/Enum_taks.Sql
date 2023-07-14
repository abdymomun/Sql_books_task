--1
select name,published_year,genre from books;
--2
select country from authors group by country;
--3
select * from books where published_year between '2020-1-1' and '2023-12-31';
--4
select name from books where genre = 'Detective';
--5
select concat(first_name, ' ', last_name) as author from authors;
--6
select concat(first_name,' ',last_name) as author from authors where country in ('Germany','France') order by author;
--7
select name,country,published_year,price,genre from books where genre <>'Romans' and  price <500;
--8
select * from authors where  gender='Female' limit 3;
--9
select * from authors where gender = 'Female' and email like '%.com' and first_name like '____';
--10
select country,count(first_name)from authors group by country;
--11
select country, count(first_name) from authors group by country having count(first_name) = 3 order by country;
--12
select genre,count(name) from books group by genre;
--13
select * from books where genre in ('Romans', 'Detective') order by price asc ;
--14
select (select concat(genre,' ', count(genre='BIOGRAPHY')) from books where genre='BIOGRAPHY' group by genre ),(select concat(genre,' ', count(genre='HISTORY')) from books where genre='HISTORY' group by genre) from books limit 1;
--15
select a,p.name from publishers p  join books b on p.id = b.publisher_id join authors a on a.id = b.author_id;
--16
select authors,p from authors join books b on authors.id = b.author_id join publishers p on p.id = b.publisher_id;
--17
select first_name,last_name,b from authors join books b on authors.id = b.author_id;
--18
select language,count(b)from languages join books b on languages.id = b.language_id group by language order by language,count(language) asc ;
--19
select publishers.name, round(sum(price)) as total_revenue from books join publishers ON books.publisher_id = publishers.id group by publishers.name;
--20
select books,first_name,last_name from books join authors a on a.id = books.author_id where published_year between '2010-1-1' and '2015-12-31';
--21
select books.name, a.first_name, a.last_name, sum(books.price) as total_price from books join authors a on a.id = books.author_id where books.published_year between '2010-01-01' and '2015-12-31' group by books.name, a.first_name, a.last_name;