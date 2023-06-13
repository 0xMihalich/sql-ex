/*
Перечислите названия головных кораблей, имеющихся в базе данных (учесть корабли в Outcomes).
*/
SELECT DISTINCT c.class
  FROM Classes c
  JOIN Outcomes o
    ON o.ship = c.class
 UNION
SELECT DISTINCT c.class
  FROM Classes c
  JOIN Ships s
    ON s.class = c.class
   AND s.name = c.class
