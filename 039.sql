/*
Задание: 39 (Serge I: 2003-02-14)
Найдите корабли, `сохранившиеся для будущих сражений`; т.е. выведенные из строя в одной битве (damaged), они участвовали в другой, произошедшей позже.
*/
WITH b AS (SELECT ship,
                  name,
                  date,
                  result
             FROM outcomes o
             LEFT JOIN battles b
               ON o.battle = b.name)
SELECT DISTINCT
       ship
  FROM b
 WHERE ship IN (SELECT r.ship
                  FROM b r
                 WHERE r.date < b.date
                   AND r.result = 'damaged')
