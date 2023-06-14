/*
Задание: 53 (Serge I: 2002-11-05)
Определите среднее число орудий для классов линейных кораблей.
Получить результат с точностью до 2-х десятичных знаков.
*/
SELECT CONVERT(NUMERIC(6,2),AVG(numGuns*1.0)) [Avg-numGuns]
  FROM Classes
 WHERE type = 'bb'
