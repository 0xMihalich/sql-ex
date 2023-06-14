/*
Задание: 60 (Serge I: 2003-02-15)
Посчитать остаток денежных средств на начало дня 15/04/01 на каждом пункте приема
для базы данных с отчетностью не чаще одного раза в день.
Вывод: пункт, остаток.
Замечание.
Не учитывать пункты, информации о которых нет до указанной даты.
*/
SELECT i.point,
       CASE WHEN inc IS NULL 
            THEN 0 
            ELSE inc 
        END - 
       CASE WHEN out IS NULL 
            THEN 0
            ELSE out 
        END Remain
  FROM (SELECT point,
               SUM(inc) inc
          FROM Income_o
         WHERE date < '2001-04-15'
         GROUP BY point) i
  FULL JOIN (SELECT point,
                    SUM(out) out 
               FROM Outcome_o
              WHERE date < '2001-04-15'
              GROUP BY point) i2
    ON i.point = i2.point
