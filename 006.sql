/*
Задание: 6 (Serge I: 2002-10-28)
Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
*/
SELECT DISTINCT P.maker,
       L.speed
  FROM Laptop L
  JOIN Product P
    ON L.model = P.model
 WHERE L.hd >= 10
 ORDER BY P.maker, L.speed
