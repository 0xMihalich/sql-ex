/*
Задание: 22 (Serge I: 2003-02-13)
Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.
*/
Select speed,
       AVG(price) avg_price
  FROM pc
 WHERE speed > '600'
 GROUP BY speed
