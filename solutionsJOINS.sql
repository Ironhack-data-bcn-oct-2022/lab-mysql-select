USE publications; 
SELECT au_id, au_lname, au_fname, title, pub_name 
	from authors 
    join publishers on titles.pub_id = publishers.pub_id
    join titles on authors.au_id = titles.title_id;

SELECT authors.au_id, au_lname, au_fname, title, pub_name 
	from titles
    join titleauthor on titles.title_id = titleauthor.title_id
    join authors on titleauthor.au_id = authors.au_id
    join publishers on titles.pub_id= publishers.pub_id; 
    
-- 2 
SELECT authors.au_id as Author_id, au_lname as lastname, au_fname as firstname, publishers.pub_id as publisher , count(title) as TITLE_COUNT
	from titles
    join titleauthor on titles.title_id = titleauthor.title_id
    join authors on titleauthor.au_id = authors.au_id
    join publishers on titles.pub_id= publishers.pub_id
    group by publisher, Author_id;

-- 3 
    
SELECT authors.au_id as Author_id, au_lname as lastname, au_fname as firstname, count(qty) as titleSales
	from titles
    join titleauthor on titles.title_id = titleauthor.title_id
	join authors on titleauthor.au_id = authors.au_id
    join sales on sales.title_id = titles.title_id
    group by Author_id
    order by titleSales DESC
    LIMIT 3; 


-- 4 
SELECT authors.au_id as Author_id, au_lname as lastname, au_fname as firstname, count(qty) as titleSales
	from titles
	left join titleauthor on titles.title_id = titleauthor.title_id
	right join authors on titleauthor.au_id = authors.au_id
	left join sales on sales.title_id = titles.title_id
    group by Author_id
    order by titleSales DESC; 
    