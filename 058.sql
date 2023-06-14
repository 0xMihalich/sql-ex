/*
Задание: 58 (Serge I: 2009-11-13)
Для каждого типа продукции и каждого производителя из таблицы Product c точностью до двух десятичных знаков
найти процентное отношение числа моделей данного типа данного производителя к общему числу моделей этого производителя.
Вывод: maker, type, процентное отношение числа моделей данного типа к общему числу моделей производителя
*/
SELECT DISTINCT
       maker,
       type,
       CAST(ROUND((COUNT(model) OVER(PARTITION BY maker, type)) * 100.0 /
                   COUNT(model) OVER(PARTITION BY maker), 2) as NUMERIC(6,2)) prc
  FROM (select pt.maker,
               pt.type,
               p.model
         from (select distinct
                      a.maker,
                      b.type
                 from Product a,
                      Product b) pt
         left join Product p
           on pt.maker = p.maker
          and pt.type = p.type) p
 ORDER BY type, maker
