/*
Задание: 43 (qwrqwr: 2011-10-28)
Укажите сражения, которые произошли в годы, не совпадающие ни с одним из годов спуска кораблей на воду.
*/
SELECT name
  FROM Battles
 WHERE year(date) NOT IN (select launched
                            from Ships
                           where launched is not null)
