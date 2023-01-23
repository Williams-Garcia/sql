use movies_db;

-- Add genre
insert into genres value(null, '2023-01-23 09:08:00',null,'Xxyz', 14, 1);
-- Add movie with new genre
insert into movies values(null, null, null, 'Argentina Campeón', 8.0, 0, '2023-01-01 00:00:00', 90, 13);
-- Update actor with new movie like fav
update actors set favorite_movie_id = 22 where id = 3;
-- Make temporary table of movies
create temporary table temporary_movies select * from movies;
-- Get temporary_movies
select * from temporary_movies;
-- Delete in temporary_movies movies with awards < 5
SET SQL_SAFE_UPDATES = 0;
delete from temporary_movies where awards < 5;
SET SQL_SAFE_UPDATES = 1;
-- Get all genres with one movie
select g.name, count(mo.genre_id) from genres g inner join movies mo on mo.genre_id = g.id group by g.id having count(mo.genre_id) > 1;
-- Get actors with movie_favorite_id has awards > 3
select act.first_name,act.last_name, mo.title, mo.awards from actors act inner join movies mo on act.favorite_movie_id = mo.id where mo.awards > 3;
-- Create index on movies
create index movies_idx on movies(id);
-- Check created index on movies
show index from movies;
-- ¿Existiría una mejora notable al crear índices on movies?
-- Puesto que movies id es un campo que se reutiliza bastante, si. Aunque también por ser clave primaria no requiere a ciencia cierta un index
-- ¿En qué otra tabla crearía un índice y por qué? 
-- En actores seria una buena implementación, puesto que es una tabla que igual se reutiliza en varias consultas