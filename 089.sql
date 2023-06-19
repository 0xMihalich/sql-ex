/*
Задание: 89 (Serge I: 2012-05-04)
Найти производителей, у которых больше всего моделей в таблице Product,
а также тех, у которых меньше всего моделей.
Вывод: maker, число моделей
*/
WITH models AS (SELECT maker, COUNT(model) qty
                  FROM Product
                 GROUP BY maker)
SELECT maker, qty
  FROM models
 WHERE qty = (select max(qty)
                from models)
 UNION
SELECT maker, qty
  FROM models
 WHERE qty = (select min(qty)
                from models)
