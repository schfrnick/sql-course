-- Sample solution for hw3, CS 431, Fall 2021

SET search_path TO yangd, public;
-- 1. Titles of all books reviewed by Kate
SELECT title
FROM edition join review v on asin = reviewedid
		join reviewer r on reviewer_id = r.id
WHERE name = 'Kate';

-- 2. Names of reviewers of books in Portugese
SELECT name
FROM edition join review v on asin = reviewedid
		join reviewer r on reviewer_id = r.id
WHERE lang = 'Portugese';

-- 3. reviewer  name, rating, comment and date of review for
-- all reviews of We Don't Eat Our Classmates, ordered by date
-- the assignment did not specify oldest or newest first, so either is ok
SELECT name, rating, comments, review_date
FROM edition join review v on asin = reviewedid
		join reviewer r on reviewer_id = r.id
WHERE title = 'We Don''t Eat Our Classmates'
ORDER BY review_date DESC;

-- 4. reviewer  name, country, rating, comment for
-- all reviews of We Don't Eat Our Classmates from outside the US
SELECT name, country, rating, comments
FROM edition join review v on asin = reviewedid
		join reviewer r on reviewer_id = r.id
WHERE title = 'We Don''t Eat Our Classmates'
	  AND country != 'United States';	
	  
-- 5. name and title for where reviewers review a book by an author of the same name
SELECT name, title
FROM edition join review v on asin = reviewedid
		join reviewer r on reviewer_id = r.id
WHERE lower(author) = lower(name);

-- 6. titles of books without reviews
SELECT title
FROM edition
WHERE NOT EXISTS
   (SELECT *
    FROM review
    WHERE reviewedid = asin);

-- 7. Titles of books with only 5-star ratings, and at least one review
SELECT title
FROM edition join review on asin = reviewedid -- makes sure at least one review exists
WHERE NOT EXISTS
   (SELECT *
    FROM review
    WHERE reviewedid = asin AND rating < 5);
	
-- 8. The 3 most recently published books
SELECT title
FROM edition
ORDER BY pubdate DESC
LIMIT 3;

-- 9. Title of highest-scoring book, based on average review rating

CREATE TEMPORARY VIEW ratings
AS SELECT asin, AVG(rating) avg_rating
    FROM review JOIN edition ON asin = reviewedid
	GROUP BY asin;
	
SELECT title, avg_rating
FROM edition e JOIN ratings r ON e.asin = r.asin
WHERE avg_rating >=
    (SELECT MAX(avg_rating)
	 FROM ratings);

