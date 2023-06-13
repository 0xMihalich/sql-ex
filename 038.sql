/*
Задание: 38 (Serge I: 2003-02-19)
Найдите страны, имевшие когда-либо классы обычных боевых кораблей ('bb') и имевшие когда-либо классы крейсеров ('bc').
*/
SELECT DISTINCT c.country
  FROM Classes c
 WHERE c.type = 'bb'
INTERSECT
SELECT DISTINCT c.country
  FROM Classes c
 WHERE c.type = 'bc'
