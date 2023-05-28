/*
Задание: 17 (Serge I: 2003-02-03)
Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
Вывести: type, model, speed
*/
SELECT DISTINCT p.type type,
                l.model model,
                l.speed speed
  FROM laptop l
  JOIN product p
    ON l.model = p.model
 WHERE l.speed < ALL (select speed from pc)
