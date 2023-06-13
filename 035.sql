/*
Задание: 35 (qwrqwr: 2012-11-23)
В таблице Product найти модели, которые состоят только из цифр или только из латинских букв (A-Z, без учета регистра).
Вывод: номер модели, тип модели.
*/
SELECT model,
       type 
  FROM Product
 WHERE model NOT LIKE '%[^0-9]%'
 UNION
SELECT model,
       type 
  FROM Product
 WHERE model NOT LIKE '%[^A-Z]%'
