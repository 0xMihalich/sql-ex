/*
Найдите классы, в которые входит только один корабль из базы данных (учесть также корабли в Outcomes).
*/
SELECT c.class
  FROM classes c
  LEFT JOIN (
             SELECT class,
                    name
               FROM ships
              UNION
             SELECT ship class,
                    ship name
               FROM outcomes
             ) s
    ON s.class = c.class
 GROUP BY c.class
HAVING COUNT(s.name) = 1
