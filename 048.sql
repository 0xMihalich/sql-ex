/*
Задание: 48 (Serge I: 2003-02-16)
Найдите классы кораблей, в которых хотя бы один корабль был потоплен в сражении.
*/
SELECT class
  FROM Ships s
  JOIN Outcomes o
    ON o.ship = s.name
 WHERE result = 'sunk'
 UNION
SELECT class
  FROM Classes c
  JOIN Outcomes o
    ON o.ship = c.class
 WHERE result = 'sunk'
