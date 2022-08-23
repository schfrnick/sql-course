-- Additional inserts for book reviews to help test queries for hw3

SET search_path TO yangd, public;

BEGIN;
-- add a couple countries to country_type for some of the reviewer data
ALTER TYPE country_type ADD VALUE 'United Kingdom' AFTER 'India';
ALTER TYPE country_type ADD VALUE 'Canada' AFTER 'India';

COMMIT;	-- need to commit new enum values before use

-- include a review from a date between the others below to make
-- sure the result is being ordered (for query 3), and at least one review from
-- a US reviewer to test if query 4 is filtering those out.
INSERT INTO review VALUES (DEFAULT, 'Packaging not protective enough',
						  '2019-12-06',
						  '0001112222',
						 2,
						  4);
						  
-- Reviewers from other countries
						  
INSERT INTO reviewer VALUES (DEFAULT, 'Laura', 'United Kingdom');
INSERT INTO review VALUES (DEFAULT, 'My daughter loved it!',
						  '2021-08-05',
						  '0001112222',
						 CURRVAL('reviewer_id_seq'),
						  5);

INSERT INTO reviewer VALUES (DEFAULT, 'chiquitabanana', 'Canada');
INSERT INTO review VALUES (DEFAULT, 'Love this book for story time',
						  '2019-07-18',
						  '0001112222',
						 CURRVAL('reviewer_id_seq'),
						  5);
						  
-- insert Amy Tan as a reviewer for query 5
-- make the name all lower case to test case-sensitivity (query should not be case-sensitive)
-- "0062107321"
INSERT INTO reviewer VALUES (DEFAULT, 'amy tan', 'United States');
INSERT INTO review VALUES (DEFAULT, 'Great book for book clubs!',
						  '2020-12-31',
						  '0062107321',
						 CURRVAL('reviewer_id_seq'),
						  5);
/*	Can uncomment these inserts if you want to test the 
average computations a bit better, but will mean there are no
books with only 5* ratings
INSERT INTO review VALUES (DEFAULT, 'Promising start',
						  '2020-12-31',
						  '0002224444',
						  CURRVAL('reviewer_id_seq'),
						  4);

INSERT INTO review VALUES (DEFAULT, 'The book was fine, but looked used',
						  '2021-01-30',
						  '0062107321',
						  1,
						  4);

INSERT INTO review VALUES (DEFAULT, 'Loved it!',
						  '2021-02-02',
						  '0062107321',
						  1,
						  5);
*/