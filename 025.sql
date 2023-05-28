/*
Задание: 25 (Serge I: 2003-02-14)
Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. Вывести: Maker
*/
SELECT DISTINCT p.maker maker
  FROM product p
  JOIN pc
    ON p.model = pc.model
 WHERE pc.ram = (SELECT MIN(ram)
                   FROM pc)
   AND pc.speed = (SELECT MAX(speed)
                     FROM pc
                    WHERE ram = (select min(ram)
                                   from pc))
   AND p.maker in (SELECT maker
                     FROM product
                    WHERE type = 'printer')
