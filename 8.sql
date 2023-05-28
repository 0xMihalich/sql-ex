/*
Задание: 8 (Serge I: 2003-02-03)
Найдите производителя, выпускающего ПК, но не ПК-блокноты.
*/
SELECT DISTINCT p1.maker
  FROM Product p1
  LEFT JOIN Product p2
    ON p1.maker = p2.maker
   AND p2.type = 'Laptop'
 WHERE p1.type = 'PC'
   AND p2.type is Null
