/*
Задание: 54 (Serge I: 2003-02-14)
С точностью до 2-х десятичных знаков определите среднее число орудий всех линейных кораблей (учесть корабли из таблицы Outcomes).
*/
SELECT CONVERT(NUMERIC(6,2),AVG(numGuns*1.0)) Avg_numG
  FROM (select name,
               class
          from Ships
         union
        select ship,
               ship
          from Outcomes) s
  JOIN Classes c
    ON s.class = c.class
 WHERE type = 'bb'
