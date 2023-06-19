/*
Задание: 91 (Serge I: 2015-03-20)
C точностью до двух десятичных знаков определить среднее количество краски на квадрате.
*/
SELECT CONVERT(NUMERIC(6, 2), AVG(paint * 1.0)) avg_paint
  FROM (select coalesce(sum(B_VOL),0) paint
          from utQ
          left join utB
            on utB.B_Q_ID = utQ.Q_ID
         group by utQ.Q_ID) t
