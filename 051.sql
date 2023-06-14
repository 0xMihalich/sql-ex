/*
Задание: 51 (Serge I: 2003-02-17)
Найдите названия кораблей, имеющих наибольшее число орудий среди всех имеющихся кораблей такого же водоизмещения (учесть корабли из таблицы Outcomes).
*/
WITH shp AS (select name,
                    class
	       from Ships
	      union
             select ship name,
                    ship class
               from Outcomes)
SELECT name
  FROM shp
  JOIN Classes c
    ON shp.class = c.class
 WHERE numguns >= ALL(select cl.numGuns
                        from Classes cl
                       where cl.displacement = c.displacement
                         and cl.class in (SELECT shp.class
                                            FROM shp)
                      )
