/*
Задание: 49 (Serge I: 2003-02-17)
Найдите названия кораблей с орудиями калибра 16 дюймов (учесть корабли из таблицы Outcomes).
*/
SELECT name
  FROM Ships s
  JOIN Classes c
    ON s.class = c.class
 WHERE bore = 16
 UNION
SELECT ship
  FROM Outcomes o
  JOIN Classes c
    ON o.ship = c.class
 WHERE bore = 16
