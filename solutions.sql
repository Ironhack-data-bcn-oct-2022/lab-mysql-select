USE publications;

-- Challenge 1 - Who Have Published What At Where?

-- In this challenge you will write a MySQL SELECT query that joins various tables to figure out what titles each author has published 
-- at which publishers. Your output should have at least the following columns:
-- -- AUTHOR ID - the ID of the author
-- -- LAST NAME - author last name
-- -- FIRST NAME - author first name
-- -- TITLE - name of the published title
-- -- PUBLISHER - name of the publisher where the title was published

-- TABLES = authors, titles, publishers
-- COLUMNS = au_ID (in authors), au_lname (in authors), au_fname (in authors), title (in titles), pub_name (in publishers)
-- KEYS = author_id, title_id, pub_id

SELECT authors.au_id AS `Author ID`, authors.au_lname AS `Last Name`, authors.au_fname AS `First Name`, titles.title AS Title, publishers.pub_name AS Publisher FROM authors
	JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
	JOIN titles
		ON titleauthor.title_id = titles.title_id
	JOIN publishers
		ON titles.pub_id = publishers.pub_id;

-- Challenge 2 - Who Have Published How Many At Where?

-- Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. 

-- TABLES = authors, titles, publishers
-- COLUMNS = au_ID (in authors), au_lname (in authors), au_fname (in authors), title (in titles), pub_name (in publishers)
-- KEYS = author_id, title_id, pub_id

SELECT authors.au_id AS `Author ID`, authors.au_lname AS `Last Name`, authors.au_fname AS `First Name`, publishers.pub_name AS Publisher, COUNT(titles.title_id) AS `Title Counts` FROM authors
	JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
	JOIN titles
		ON titleauthor.title_id = titles.title_id
	JOIN publishers
		ON titles.pub_id = publishers.pub_id
	GROUP BY authors.au_id
    ORDER BY  Publisher, `Last Name`;

-- Challenge 3 -  Best Selling Authors

-- Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.
-- Requirements:
-- Your output should have the following columns:
	-- AUTHOR ID - the ID of the author
	-- LAST NAME - author last name
	-- FIRST NAME - author first name
	-- TOTAL - total number of titles sold from this author
-- Your output should be ordered based on TOTAL from high to low.
-- Only output the top 3 best selling authors.

SELECT authors.au_id AS `Author ID`, authors.au_lname AS `Last Name`, authors.au_fname AS `First Name`, SUM(sales.qty) AS Sales FROM authors
	JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
	JOIN titles
		ON titleauthor.title_id = titles.title_id
	JOIN sales
		ON titles.title_id = sales.title_id
	GROUP BY authors.au_id
    ORDER BY Sales DESC
    LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking

-- Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 
-- Note that the authors who have sold 0 titles should also appear in your output 
-- (ideally display 0 instead of NULL as the TOTAL). Also order your results based on TOTAL from high to low.

SELECT authors.au_id AS `Author ID`, authors.au_lname AS `Last Name`, authors.au_fname AS `First Name`, IFNULL(SUM(sales.qty),0) AS Sales FROM authors
	LEFT JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
	LEFT JOIN titles
		ON titleauthor.title_id = titles.title_id
	LEFT JOIN sales
		ON titles.title_id = sales.title_id
	GROUP BY authors.au_id
    ORDER BY Sales DESC
    LIMIT 23;