/*
Задание: 21 (Serge I: 2003-02-13)
Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
Вывести: maker, максимальная цена.
*/
SELECT maker,
       MAX(price) max_price
  FROM Product p
  JOIN PC
    ON PC.model = p.model
 GROUP BY maker
