/*
Задание: 28 (Serge I: 2012-05-04)
Используя таблицу Product, определить количество производителей, выпускающих по одной модели.
*/
SELECT COUNT(maker) qty
FROM (SELECT DISTINCT maker
        FROM product
       GROUP BY maker
      HAVING COUNT(model) = 1) prod
