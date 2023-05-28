/*
Задание: 2 (Serge I: 2002-09-21)
Найдите производителей принтеров. Вывести: maker
*/
SELECT maker
  FROM Product
 WHERE type = 'Printer'
 GROUP BY maker
