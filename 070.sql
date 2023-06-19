/*
Задание: 70 (Serge I: 2003-02-14)
Укажите сражения, в которых участвовало по меньшей мере три корабля одной и той же страны.
*/
SELECT DISTINCT battle bat
  FROM (select name ship , class
          from Ships s
         union
        select ship, ship class
          from Outcomes o) sh
  JOIN Classes c
    ON c.class = sh.class
  JOIN Outcomes o
    ON o.ship = sh.ship
 GROUP BY battle, country
HAVING count(country) >= 3
