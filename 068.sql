/*
Задание: 68 (Serge I: 2010-03-27)
Найти количество маршрутов, которые обслуживаются наибольшим числом рейсов.
Замечания.
1) A - B и B - A считать ОДНИМ И ТЕМ ЖЕ маршрутом.
2) Использовать только таблицу Trip
*/
WITH q AS (select count(*) qty
             from trip
            group by case when town_from > town_to
                          then town_from + town_to
                          when town_from < town_to
                          then town_to + town_from
    end)
SELECT COUNT(q.qty)
  FROM q
 WHERE qty = (select max(qty) from q)
 
