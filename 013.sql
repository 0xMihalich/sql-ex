/*
Задание: 13 (Serge I: 2002-11-02)
Найдите среднюю скорость ПК, выпущенных производителем A.
*/
SELECT AVG(speed) Avg_speed
  FROM Product
  JOIN PC
    ON Product.model = PC.model
 WHERE maker = 'A'
