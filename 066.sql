/*
Задание: 66 (Serge I: 2003-04-09)
Для всех дней в интервале с 01/04/2003 по 07/04/2003
определить число рейсов из Rostov с пассажирами на борту.
Вывод: дата, количество рейсов.
*/
WITH ds AS (SELECT date = CONVERT(DATETIME, '2003-04-01')
             UNION ALL SELECT
                   date = DATEADD(DAY, 1, date)
              FROM ds
             WHERE date < '2003-04-07')
SELECT ds.date Dt,
       count(distinct time_out) Qty
  FROM ds
  LEFT JOIN Pass_in_trip p
    ON ds.date = p.date
  LEFT JOIN Trip t
    ON p.trip_no = t.trip_no
   AND town_from = 'Rostov'
 GROUP BY ds.date
