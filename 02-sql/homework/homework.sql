select * from movies where year = 1994; 
-- 1. pelis del año en que nací

select count(*) from movies where year = 1982; 
--2. cuantas pelis de 1982

select * from actors where last_name like '%stack%'; 
--3. actores con el substring stack en su apellido

select last_name, count(last_name) as count from actors group by first_name order by count desc limit 10;
--4. 10 nombres y apellidos más populares NO ME SALE

select actor_id, 
count(role) as count from roles group by actor_id order by count desc limit 10;
--5. 100 actores con más roles realizados

select genre, count(genre) as count from movies_genres group by genre order by count; 
--6.cantidad de pelis según género (de menos popular a más popular)

select (actors.first_name || ' ' || actors.last_name) as 'Nombre y apellido' from actors 
join roles on actors.id = roles.actor_id and roles.movie_id = (select id from movies where name = 'Braveheart');
--7. Actores de Braveheart


select distinct (first_name || ' ' || last_name) as 'Nombre y apellido', directors_genres.genre from directors join directors_genres on directors.id = director_id and directors_genres.genre = 'Film-Noir' join movies on directors.id = director_id and year % 4 = 0;
--8. Directores de Film-noir de pelis en años bisiestos


--Listá todos los actores que hayan trabajado con Kevin Bacon en películas de Drama
--(incluí el título de la peli). Excluí al señor Bacon de los resultados.


select actors.first_name, actors.last_name, movies.year from actors 
join roles on actors.id = roles.actor_id 
join movies on roles.movie_id = movies.id and movies.year < 1900 and movies.year > 2000;
--10. Immortal Actors
--Qué actores actuaron en una película antes de 1900 y también en una película después del 2000?



--11. Buscá actores que actuaron en cinco o más roles en la misma película después del año 1990. 
--Noten que los ROLES pueden tener duplicados ocasionales, sobre los cuales no estamos interesados: 
--queremos actores que hayan tenido cinco o más roles DISTINTOS (DISTINCT cough cough) en la misma película. 
--Escribí un query que retorne los nombres del actor, el título de la película y el número de roles 
--(siempre debería ser > 5).







