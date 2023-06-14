/*
Задание: 56 (Serge I: 2003-02-16)
Для каждого класса определите число кораблей этого класса, потопленных в сражениях.
Вывести: класс и число потопленных кораблей.
*/
SELECT class,
       SUM(CASE WHEN result='sunk'
                THEN 1
                ELSE 0
            END) Sunks
  FROM (select c.class class,
               s.name name
		      from Classes c
          left join Ships s
		        on c.class = s.class
         union
        select c.class class,
		           o.ship name
		      from Classes c
          join Outcomes o
		        on c.class = o.ship) shp
  LEFT JOIN Outcomes o
    ON shp.name = o.ship
 GROUP BY class
