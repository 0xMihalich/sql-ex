/*
Задание: 27 (Serge I: 2003-02-03)
Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker, средний размер HD.
*/
SELECT maker,
       avg(hd) as avg_hd
  FROM Product p
  JOIN PC
    ON p.model = PC.model
 WHERE maker in (SELECT maker
                   FROM product
                  WHERE type = 'Printer')
 GROUP BY maker
