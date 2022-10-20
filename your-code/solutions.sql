
USE publications;

-- CHALANGE 1
Select authors.au_id as `AUTHORS ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, titles.title AS TITLE, pub_name AS PUBLISHER
from titles
left join titleauthor
	on titles.title_id = titleauthor.title_id
left join authors
	on titleauthor.au_id = authors.au_id
LEFT JOIN publishers
	on titles.pub_id = publishers.pub_id;
    
-- CHALANGE 2
SELECT authors.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, publishers.pub_id AS PUBLISHER , COUNT(title) AS `TITLE COUNT`
from titles
join titleauthor 
	on titles.title_id = titleauthor.title_id
join authors 
	on titleauthor.au_id = authors.au_id
join publishers 
	on titles.pub_id= publishers.pub_id
GROUP BY PUBLISHER, `AUTHOR ID`;

-- CHALANGE 3
SELECT authors.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, count(qty) as `TOTAL SALES`
from titles
join titleauthor 
	on titles.title_id = titleauthor.title_id
join authors 
	on titleauthor.au_id = authors.au_id
join sales 
	on sales.title_id = titles.title_id
group by `AUTHOR ID`
order by `TOTAL SALES` DESC
LIMIT 3; 

-- CHALANGE 4
SELECT authors.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, count(qty) as `TOTAL SALES`
from titles
left join titleauthor 
	on titles.title_id = titleauthor.title_id
right join authors 
	on titleauthor.au_id = authors.au_id
left join sales 
	on sales.title_id = titles.title_id
group by `AUTHOR ID`
order by `TOTAL SALES` DESC;




    
