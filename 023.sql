/*
Задание: 23 (Serge I: 2003-02-14)
Найдите производителей, которые производили бы как ПК
со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.
Вывести: Maker
*/
SELECT p.maker
  FROM product p
  JOIN PC
    ON p.model = pc.model
 WHERE pc.speed >= '750'
INTERSECT
SELECT p.maker
  FROM product p
  JOIN laptop l
    ON p.model = l.model
 WHERE l.speed >= '750'
