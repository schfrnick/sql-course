
create table book (
 ASIN character varying(20) not null,
 title character varying(20) not null, 
 name character varying(20) not null,
 publisher character varying(20) not null,
 pubdate date not null,
 pages bigint not null);

 
-- okay so we are keeping the asin limited to 20 characters  along with allocated
-- space for the title name publisher while allowing the user to add a publishing date and pages.