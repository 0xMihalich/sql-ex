/*
Задание: 69 (Serge I: 2011-01-06)
По таблицам Income и Outcome для каждого пункта приема найти остатки денежных средств на конец каждого дня,
в который выполнялись операции по приходу и/или расходу на данном пункте.
Учесть при этом, что деньги не изымаются, а остатки/задолженность переходят на следующий день.
Вывод: пункт приема, день в формате "dd/mm/yyyy", остатки/задолженность на конец этого дня.
*/
WITH Q AS (select isnull(i.point, o.point) point,
                  isnull(i.date, o.date) date,
                  coalesce(sum(i.inc), 0) - coalesce(sum(o.out), 0) rem
             from income i
             full join outcome o
               on i.point = o.point
              and i.date = o.date
              and i.code = o.code
            group by isnull(i.point, o.point),
                     isnull(i.date, o.date))
SELECT point,
       CONVERT(VARCHAR, date, 103) day,
	   SUM(rem) OVER(PARTITION BY point
	                 ORDER BY date
                         RANGE UNBOUNDED PRECEDING) rem
  FROM Q
 ORDER BY point, date
