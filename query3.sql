--query 3
DELETE FROM schaen.review;


-- we are creating a table to hold our reviews as last week i made an error i jsut realized in formatting it and am recreating the table.
create table review (
id bigserial PRIMARY KEY,
comments text,
review_date date,
reviewer_id integer REFERENCES reviewer (id),
reviewedid 	integer,
rating 		integer);


insert into schaen.review VALUES(DEFAULT,'this book was solid','2021-08-05','A101232111',DEFAULT,'8');
insert into schaen.review VALUES(DEFAULT,'great book','2020-08-21','B123454321',DEFAULT,'7');
insert into schaen.review VALUES(DEFAULT,'okay','2020-08-20','B123454321',DEFAULT,'8');

select	title,asin
from	reviewer join review join edition
where reviewer = 'bob villa'