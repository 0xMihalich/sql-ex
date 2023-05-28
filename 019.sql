/*
Задание: 18 (Serge I: 2003-02-03)
Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
*/
SELECT DISTINCT maker,
       p.price price
  FROM Printer p
  JOIN Product pr
    ON p.model = pr.model
   AND p.color = 'y'
 WHERE price = (select min(price)
                  from Printer
                 where color = 'y')
