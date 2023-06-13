/*
Задание: 40 (Serge I: 2012-04-20)
Найти производителей, которые выпускают более одной модели, при этом все выпускаемые производителем модели являются продуктами одного типа.
Вывести: maker, type
*/
SELECT maker,
       type
  FROM Product
 WHERE maker in (select maker
                   from (SELECT maker,
                                type
                          FROM Product
                         GROUP BY maker, type) p
                   group by maker
                  having count(maker) = 1)
 GROUP BY maker, type 
HAVING COUNT(*) > 1
