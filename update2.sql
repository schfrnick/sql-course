ALTER TABLE schaen.book RENAME TO edition;
DELETE FROM schaen.edition;
	
	
ALTER TABLE schaen.edition ADD PRIMARY KEY (asin);
ALTER TABLE schaen.edition ADD CONSTRAINT pages CHECK (pages > 5);
alter table schaen.edition add column format text NOT NULL;
alter table schaen.edition add column language text;
alter table schaen.edition add column price money not null;
-- these are our table edits and constraints
-- we create our new tables below using big serial to assign a primary key and name the reviewer and their country
CREATE TABLE reviewer (
id bigserial PRIMARY KEY,
name text,
country text
);
-- we are creating a table to hold our reviews and 
create table review (
id bigserial PRIMARY KEY,
comments text,
review_date date,
reviewer_id integer REFERENCES reviewer,
reviewedid integer REFERENCES reviewer (id),
rating integer);

