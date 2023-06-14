/*
Задание: 59 (Serge I: 2003-02-15)
Посчитать остаток денежных средств на каждом пункте приема для базы данных с отчетностью не чаще одного раза в день.
Вывод: пункт, остаток.
*/
SELECT COALESCE(i.point, o.point) point,
       SUM(COALESCE(i.inc, 0)) - SUM(COALESCE(o.out, 0)) as Remain
  FROM income_o i
  FULL JOIN outcome_o o
    ON i.date = o.date
   AND i.point = o.point
 GROUP BY COALESCE(i.point, o.point)
 ORDER BY point, Remain
