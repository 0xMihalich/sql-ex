/*
Задание: 44 (Serge I: 2002-12-04)
Найдите названия всех кораблей в базе данных, начинающихся с буквы R.
*/
SELECT name
  FROM Ships
 WHERE name LIKE 'R%'
 UNION
SELECT ship
  FROM Outcomes
 WHERE ship LIKE 'R%'
