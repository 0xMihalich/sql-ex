/*
Задание: 24 (Serge I: 2003-02-03)
Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.
*/
WITH all_model AS (
                SELECT model,
                       price
                  FROM pc
                 UNION ALL
                SELECT model,
                       price
                  FROM printer
                 UNION ALL
                SELECT model,
                       price
                  FROM laptop)
SELECT DISTINCT model
  FROM all_model
 WHERE price = ALL(
                SELECT max(price)
                  FROM all_model)
