/*
Задание: 10 (Serge I: 2002-09-23)
Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
*/
SELECT model,
       price
  FROM printer
 WHERE price = (
       SELECT MAX(price)
         FROM printer
       )
 ORDER BY model
