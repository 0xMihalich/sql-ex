/*
Задание: 30 (Serge I: 2003-02-14)
В предположении, что приход и расход денег на каждом пункте приема фиксируется произвольное число раз (первичным ключом в таблицах является столбец code),
требуется получить таблицу, в которой каждому пункту за каждую дату выполнения операций будет соответствовать одна строка.
Вывод: point, date, суммарный расход пункта за день (out), суммарный приход пункта за день (inc).
Отсутствующие значения считать неопределенными (NULL).
*/
SELECT point,
       date,
       SUM(sum_out) outcome,
       SUM(sum_inc) income
 FROM (SELECT point,
              date,
              SUM(inc) sum_inc,
              NULL sum_out
         FROM income
        GROUP BY point, date
        UNION
       SELECT point,
              date,
              NULL sum_inc,
              SUM(out) sum_out
         FROM outcome
        GROUP BY point, date) t
GROUP BY point, date
ORDER BY point
