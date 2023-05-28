/*
Задание: 26 (Serge I: 2003-02-14)
Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена.
*/
SELECT AVG(price) avg_price
  FROM (SELECT price
          FROM PC
         WHERE model IN (SELECT model
                           FROM product
                          WHERE maker='A'
                            AND type='PC')
         UNION ALL
        SELECT price
          FROM Laptop
         WHERE model IN (SELECT model
                           FROM product
                          WHERE maker='A'
                            AND type='Laptop')
         ) pc_laptop_maker
