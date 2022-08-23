SET search_path TO yangd, public;
-- Grading note: as long as you insert at least one record into each table, that's enough for this assignment
-- As you might guess, I was originally going to include queries as well, but
-- ended up splitting that off, though I forgot to edit the descrption

-- inserting non-English book, different format
INSERT INTO edition VALUES('B01MSCXAHI', 'O sol também é uma estrela',
						   'Nicola Yoon', 'Editora Arqueiro', 'May 9 2017',
						   null, -- treating the 'print length' value as something different
						  'Kindle', 'Portugese', 7.49);
				
-- inserting reviews
-- because the reviewer ID is a BIGSERIAL, I am using CURRVAL()
-- to get the most recent auto-generated value for a specific sequence
-- (look at Sequences on pgAdmin)
-- Because this value will change after another reviewer is inserted,
-- I am alternating
-- inserting a new reviewer with inserting reviews from that reviewer
-- before moving on to the next reviewer
-- it's ok for the assignment if you hard-coded the ID
INSERT INTO reviewer VALUES (DEFAULT, 'Pattie Meng', 'United States');
INSERT INTO review VALUES
						(DEFAULT,'How "used" is the used book?',
						  '2018-07-08',
						  '1112223333',
						 CURRVAL('reviewer_id_seq'),
						  2);

INSERT INTO reviewer VALUES (DEFAULT, 'Kate', 'United States');
INSERT INTO review VALUES (DEFAULT, 'Daniel Aleman''s INDIVISIBLE is one of those books that you can''t put down',
						  '2021-05-12',
						  '0002224444',
						 CURRVAL('reviewer_id_seq'),
						  5);
INSERT INTO review VALUES (DEFAULT, 'Read this for my Portugese class -- not bad for homework',
						  '2021-04-30',
						  'B01MSCXAHI',
						 CURRVAL('reviewer_id_seq'),
						  4);						  

	
