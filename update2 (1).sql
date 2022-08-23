SET search_path TO yangd, public;

-- Each edition has different values for many attributes, and even some different attributes
ALTER TABLE book RENAME TO edition;

-- Not required for the assignment, but shows another tool for enforcing constraints
-- enumerated types to limit possible values
CREATE TYPE format_type AS ENUM ('Hardcover', 'Paperback', 'Kindle');
CREATE TYPE lang_type AS ENUM ('English', 'Portugese', 'French');
CREATE TYPE country_type AS ENUM ('China', 'India', 'United States');

-- Fix data so that constraints can be added
-- Can use update or delete
-- Update record with duplicate ASIN
UPDATE edition SET ASIN = '111222333B' WHERE title = 'Duplicate ASIN';
-- Delete record with zero pages
DELETE FROM edition WHERE pages = 0;
-- Forgot to add this as a requirement in the assignment, but here is
-- an update for the book with the null title
UPDATE edition SET title='Example book',publisher='Example publisher' WHERE ASIN = '123456NULL';

-- modify edition to modify list of attributes, add constraints
-- use ASIN as the primary key
ALTER TABLE edition ADD PRIMARY KEY(ASIN);
-- make sure pages is positive
ALTER TABLE edition ADD CHECK(pages > 0);

-- add attributes 
-- format for paperback/Kindle/etc.
ALTER TABLE edition ADD COLUMN format format_type;
-- primary language of this edition
ALTER TABLE edition ADD COLUMN lang lang_type;
-- price of edition, in US $
ALTER TABLE edition ADD COLUMN price MONEY;

-- fill in the values for the records that are already in the database
-- Using the option to update multiple columns at once
UPDATE edition SET format = 'Paperback', lang = 'English', price = 33.55 WHERE ASIN='0465024750';
UPDATE edition SET format = 'Hardcover', lang = 'English', price = 17.99 WHERE ASIN='0001112222';
UPDATE edition SET format = 'Paperback', lang = 'English', price = 14.36 WHERE ASIN='1112223333';
UPDATE edition SET format = 'Hardcover', lang = 'English', price = 16.07 WHERE ASIN='0062107321';
UPDATE edition SET format = 'Hardcover', lang = 'English', price = 18.99 WHERE ASIN='0002224444';
UPDATE edition SET format = 'Kindle', lang = 'Portugese', price = 9.99 WHERE ASIN='111222333B';
UPDATE edition SET format = 'Hardcover', lang = 'French', price = 8.99 WHERE ASIN='123456NULL';

-- now that all required values have been added, we can add the NOT NULL constraints
ALTER TABLE edition
	ALTER COLUMN title SET NOT NULL,
	ALTER COLUMN publisher SET NOT NULL,
	ALTER COLUMN pubdate SET NOT NULL,
	ALTER COLUMN format SET NOT NULL,
	ALTER COLUMN lang SET NOT NULL,
	ALTER COLUMN price SET NOT NULL
	;
-- pages can be null for audio books. For Kindle, there is a "print length", even though there is no physical book
	
-- reviewer table -- for Amazon
CREATE TABLE reviewer(
	id BIGSERIAL PRIMARY KEY,
	name varchar NOT NULL,
	country country_type NOT NULL
);

-- review table for the reviews of each edition
CREATE TABLE review(
	id BIGSERIAL PRIMARY KEY,
	comments TEXT NOT NULL,
	review_date DATE NOT NULL,
	reviewedid varchar NOT NULL REFERENCES edition,
	reviewer_id bigint NOT NULL REFERENCES REVIEWER,
	rating int NOT NULL
);