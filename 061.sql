/*
Задание: 61 (Serge I: 2003-02-14)
Посчитать остаток денежных средств на всех пунктах приема
для базы данных с отчетностью не чаще одного раза в день.
*/
SELECT SUM(COALESCE(i.inc, 0)) - SUM(COALESCE(o.out, 0)) Remain
  FROM Income_o i
  FULL JOIN Outcome_o o
    ON i.date = o.date
   AND i.point = o.point
