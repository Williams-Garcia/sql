use movies_db;
#	Get full name from actors and rating
select id, concat(first_name, ' ', last_name) AS fullName, rating from actors;

#	Get all movies
select * from movies;

#	Get all series in spanish
select id, title as titulo from series;

#	Get full name from actors by rating > 7.5
select id, concat(first_name, ' ', last_name) AS fullName, rating from actors where rating > 7.5;

#	Get title, rating, awards from movies by rating 7.5 & awards >2
select id, title as titulo, rating, awards from movies where rating > 7.5 and awards > 2;

#	Get title & rating movies order by rating asc
select id, title as titulo, rating from movies order by rating asc;

#	Get last 3 movies
select id, title as titulo from movies limit 3;

#	Get top 5 movies
select id, title as titulo, rating from movies order by rating desc limit 5;

#	Get last 1o actors
select id, concat(first_name, ' ', last_name) AS fullName from actors limit 10;

#	Get Toy Story movies
select id, title as titulo, rating from movies where title = 'Toy Story';

#	Get actors by name like sam
select id, concat(first_name, ' ', last_name) AS fullName from actors where first_name = first_name and first_name like 'sam%';

#	Get title movies between 2004 - 2008
select id, title as titulo, release_date from movies where id = id and release_date between '2004-01-01' and '2008-12-31';

#	Get title movie by rating > 3 & awards > 1 & between 1988 - 2009 order by rating
select id, title as titulo, rating, awards, release_date from movies where rating > 3 and awards > 1 and release_date between '1988-01-01' and '2009-12-31' order by rating desc;