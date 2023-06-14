/*
Задание: 57 (Serge I: 2003-02-14)
Для классов, имеющих потери в виде потопленных кораблей и не менее 3 кораблей в базе данных, вывести имя класса и число потопленных кораблей.
*/
SELECT class cls,
       SUM(CASE WHEN result = 'sunk'
                THEN 1
                ELSE 0
            END) sunken
  FROM (select c.class,
               name
		      from Classes c
          join Ships s
		        on c.class = s.class
         union
        select class,
		           ship
		      from Classes 
          join Outcomes
		        on class = ship) shp
  LEFT JOIN Outcomes o
    ON shp.name = o.ship
  GROUP BY class
 HAVING SUM(CASE WHEN result = 'sunk'
                 THEN 1
				         ELSE 0
			       END) > 0
    AND (select count(sl.name)
	         from (select s.name,
		                    s.class
				           from Ships s
                  union
                 select o.ship,
				                o.ship
				           from Outcomes o) sl
                  where sl.class = shp.class
                  group by sl.class) >= 3
