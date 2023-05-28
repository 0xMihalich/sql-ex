/*
Задание: 14 (Serge I: 2002-11-05)
Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
*/
SELECT c.class class,
       name,
       country
  FROM Ships s
  JOIN Classes c
    ON s.class = c.class
 WHERE c.numGuns >= 10
