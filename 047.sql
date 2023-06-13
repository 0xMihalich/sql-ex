/*
Задание: 47 (Serge I: 2019-06-07)
Определить страны, которые потеряли в сражениях все свои корабли.
*/
WITH out AS (SELECT *
               FROM outcomes
			   JOIN (SELECT ships.name s_name,
			                classes.class s_class,
							classes.country s_country
                       FROM ships
					   FULL JOIN classes
                         ON ships.class = classes.class
                    ) u
                 ON outcomes.ship=u.s_class
              UNION
             SELECT *
               FROM outcomes
			   JOIN (SELECT ships.name s_name,
			                classes.class s_class,
							classes.country s_country
                       FROM ships
					   FULL JOIN classes
                         ON ships.class = classes.class
                    ) u
                 ON outcomes.ship=u.s_name)
SELECT fin.country
  FROM (SELECT DISTINCT t.country,
               COUNT(t.name) num_ships
        FROM (select distinct c.country,
		             s.name
                from classes c
                join Ships s
				  on s.class = c.class
               union
              select distinct c.country,
			         o.ship
                from classes c
                join Outcomes o
				  on o.ship= c.class) t
       GROUP BY t.country
       INTERSECT
       SELECT out.s_country,
              COUNT(out.ship) num_ships
         FROM out
        WHERE out.result = 'sunk'
        GROUP BY out.s_country) fin
