/*
Задание: 15 (Serge I: 2003-02-03)
Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
*/
SELECT hd
  FROM PC
 GROUP BY hd
HAVING COUNT(model) >= 2
