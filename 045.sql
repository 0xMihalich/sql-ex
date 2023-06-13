/*
Задание: 45 (Serge I: 2002-12-04)
Найдите названия всех кораблей в базе данных, состоящие из трех и более слов (например, King George V).
Считать, что слова в названиях разделяются единичными пробелами, и нет концевых пробелов.
*/
SELECT name
  FROM Ships
 WHERE name LIKE '% % %'
 UNION
SELECT ship
  FROM Outcomes
 WHERE ship LIKE '% % %'
