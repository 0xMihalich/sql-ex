/*
Задание: 9 (Serge I: 2002-11-02)
Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
*/
SELECT DISTINCT p.maker
  FROM PC
  JOIN Product p
    ON PC.model = p.model
 WHERE PC.speed >= 450
