/*
Задание: 62 (Serge I: 2003-02-15)
Посчитать остаток денежных средств на всех пунктах приема на начало дня 15/04/01
для базы данных с отчетностью не чаще одного раза в день.
*/
SELECT SUM(COALESCE(inc, 0) - COALESCE(out, 0)) Remain
  FROM (SELECT point,
               SUM(inc) inc
          FROM Income_o
         WHERE date < '20010415'
         GROUP BY point) i
  FULL JOIN (SELECT point,
                    SUM(out) out 
               FROM Outcome_o
              WHERE date < '20010415'
              GROUP BY point) i2
    ON i.point = i2.point
