USE publications;

-- COLUMNS: AUTHOR ID, LAST NAME, FIRST NAME, TITLE, PUBLISHER

-- what titles each author has published at which publishers
USE publications;
SELECT authors.au_id as "AUTHOR ID", authors.au_lname as "LAST NAME", authors.au_fname as "FIRST NAME", titles.title as "TITLE", publishers.pub_name as "PUBLISHER"
	FROM authors
	JOIN titleauthor
	ON authors.au_id = titleauthor.au_id
	JOIN titles
	ON titleauthor.title_id = titles.title_id
	JOIN publishers
	ON titles.pub_id = publishers.pub_id;
    
-- Challenge 2 - Who Have Published How Many At Where?
    
    -- query how many titles each author has published at each publisher
    
USE publications;
SELECT authors.au_id as "AUTHOR ID", authors.au_lname as "LAST NAME", authors.au_fname as "FIRST NAME", publishers.pub_name as "PUBLISHER",count(titles.title) as "TITLE COUNT"
	FROM authors
	JOIN titleauthor
	ON authors.au_id = titleauthor.au_id
	JOIN titles
	ON titleauthor.title_id = titles.title_id
	JOIN publishers
	ON titles.pub_id = publishers.pub_id
    GROUP BY authors.au_id
    ORDER BY PUBLISHER AND "LAST NAME";
    
    
-- Challenge 3 - Best Selling Authors
-- Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.



USE publications;
SELECT 
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    SUM(qty) AS 'TOTAL'
FROM
    authors
        JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
        JOIN
    titles ON titleauthor.title_id = titles.title_id
        JOIN
    sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;
    
    
    -- Challenge 4 - Best Selling Authors Ranking
-- Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 
-- Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). 
-- Also order your results based on TOTAL from high to low.


USE publications;
SELECT 
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    IFNULL(SUM(qty),0) AS 'TOTAL'
FROM
    authors
        LEFT JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
        LEFT JOIN
    titles ON titleauthor.title_id = titles.title_id
        LEFT JOIN
    sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 23;