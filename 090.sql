/*
Задание: 90 (Serge I: 2012-05-04)
Вывести все строки из таблицы Product,
кроме трех строк с наименьшими номерами моделей
и трех строк с наибольшими номерами моделей.
*/
SELECT *
  FROM Product
 WHERE model not in (select *
                       from (SELECT TOP 3 model
                               FROM Product
                              ORDER BY model) m
                      union
                     select *
                       from (SELECT TOP 3 model
                               FROM Product
                              ORDER BY model desc) m)
 ORDER BY maker, model
