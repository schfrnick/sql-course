select distinct publisher from schaen.book;
--just checking who the publisher is
select distinct name('bob villa'),pages from schaen.book;
select distinct name, extract(year from pubdate) from schaen.book
-- so what we did was we would call the anme of the author then sift by the year that their books were published
