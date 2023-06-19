/*
Задание: 71 (Serge I: 2008-02-23)
Найти тех производителей ПК, все модели ПК которых имеются в таблице PC.
*/
SELECT maker
  FROM Product p
  LEFT JOIN PC
    ON p.model = PC.model
 WHERE p.type = 'PC'
 GROUP BY maker
HAVING COUNT(p.model) = COUNT(pc.model)
