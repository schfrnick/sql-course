ALTER TABLE schaen.edition RENAME TO shopping;
DELETE FROM schaen.shopping;
	-- we are modifying our talbe from the point we were at in homework two
	-- we want to make edition its own column after this to represent different generations of products under the same name
alter table schaen.shopping add column department text NOT NULL;
alter table schaen.shopping add column edition text NOT NULL;
	-- we also added the department filter so that if we want to look for a specific set of items from say the pet department we are able to.
insert into schaen.shopping values('28473893','Dog Bowl','Smith','Pet inc','2021-07-04', DEFAULT , 'Plastic', 'English', '3.99','Pet','1st');
insert into schaen.shopping values('37842968','Dog Treat','Richards','Pet inc','2020-08-02',Default, 'Food', 'English','5.99','Pet','1st');
insert into schaen.shopping values('94587923','Dog Treat','Richards','Pet inc','2019-06-18',default, 'Food','English','9.99','Pet','2nd');
insert into schaen.shopping values('84392024','Dog Toy','Jacobby','PetMart','2010-12-11', default, 'Plastic','English','1.99','Pet','1st');
insert into schaen.shopping values('23456543','Farmers Diary','Tyson','EReadersDigest','2021-07-04','200', 'ebook', 'spanish', '12.99','Books','2nd');
insert into schaen.shopping values('83420948','Solo Leveling','Epson','BigBookMaker','2020-01-01','500','paperback','English','17.99','Books','1st');
insert into schaen.shopping values('38249282','Solo Leveling 2', 'Epson','BigBookMaker','2020-12-01','400','paperback','Japanese','19.99','Books','1st');
   -- a lot of sample data inserted.
   --we then have some test querys below.
select distinct asin from schaen.shopping;
select title, asin, publisher, department, edition
from schaen.shopping
where name = 'epson';
select edition,price,asin
from schaen.shopping 
where title = 'Dog Treat';
-- this one tests a print based on name showing the different editions and related pricing.

