/*
Задание: 64 (Serge I: 2010-06-04)
Используя таблицы Income и Outcome, для каждого пункта приема определить дни, когда был приход, но не было расхода и наоборот.
Вывод: пункт, дата, тип операции (inc/out), денежная сумма за день.
*/
SELECT COALESCE(i.point, o.point) point,
       COALESCE(i.date, o.date) date,
       CASE WHEN SUM(inc) IS NOT NULL
            THEN 'inc'
            WHEN SUM(out) IS NOT NULL
            THEN 'out'
        END operation,
       COALESCE(SUM(inc), SUM(out)) money_sum
  FROM Income i
  FULL JOIN Outcome o
    ON i.date = o.date
   AND i.point = o.point
 GROUP BY COALESCE(i.point, o.point), COALESCE(i.date, o.date)
HAVING SUM(inc) IS NULL
    OR SUM(out) IS NULL
 ORDER BY point, date
