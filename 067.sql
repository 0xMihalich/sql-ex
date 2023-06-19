/*
Задание: 67 (Serge I: 2010-03-27)
Найти количество маршрутов, которые обслуживаются наибольшим числом рейсов.
Замечания.
1) A - B и B - A считать РАЗНЫМИ маршрутами.
2) Использовать только таблицу Trip
*/
WITH q AS (select count(*) qty
             from trip
            group by town_from, town_to)
SELECT COUNT(q.qty) qty
  FROM q
 WHERE qty = (select max(qty) from q)
