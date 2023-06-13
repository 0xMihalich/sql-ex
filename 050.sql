/*
Задание: 50 (Serge I: 2002-11-05)
Найдите сражения, в которых участвовали корабли класса Kongo из таблицы Ships.
*/
SELECT DISTINCT battle
  FROM Outcomes o
  JOIN Ships s
    ON o.ship = s.name
 WHERE s.class = 'Kongo'
