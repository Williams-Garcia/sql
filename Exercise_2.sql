use movies_db;
#	Title & name series genre
select s.title as titulo, g.name as genero from series s inner join genres g on s.genre_id = g.id;

#	Mostrar el título de los episodios, el nombre y apellido de los actores que trabajan en cada uno de ellos.
select e.title, concat(a.first_name, ' ' ,a.last_name) as ActorName from episodes e inner join actor_episode ae on e.id = ae.episode_id inner join actors a on ae.actor_id = a.id;

#Mostrar el título de todas las series y el total de temporadas que tiene cada una de ellas.
select s.title as titulo, se.serie_id, count(se.number) from series s inner join seasons se on se.serie_id = s.id group by se.serie_id;

#Mostrar el nombre de todos los géneros y la cantidad total de películas por cada uno, siempre que sea mayor o igual a 3.
select mo.genre_id, count(*) totalMovies, g.name from movies mo inner join genres g on mo.genre_id = g.id group by mo.genre_id having count(*)>=3;

#Mostrar sólo el nombre y apellido de los actores que trabajan en todas las películas de la guerra de las galaxias y que estos no se repitan.
select mo.title, concat(ac.first_name, ' ' ,ac.last_name) as ActorName from movies mo inner join actor_movie am on am.movie_id = mo.id inner join actors ac on ac.id = am.actor_id where mo.id = 3 or mo.id = 4 group by mo.title, ac.first_name, ac.last_name;