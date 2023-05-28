/*
Задание: 29 (Serge I: 2003-02-14)
В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день [т.е. первичный ключ (пункт, дата)],
написать запрос с выходными данными (пункт, дата, приход, расход). Использовать таблицы Income_o и Outcome_o.
*/
SELECT i.point,
       i.date,
       inc,
       out
  FROM income_o i
  LEFT JOIN outcome_o o
    ON i.point = o.point
   AND i.date = o.date
 UNION
SELECT o.point,
       o.date,
       inc,
       out
  FROM income_o i
 RIGHT JOIN outcome_o o
    ON i.point = o.point
   AND i.date = o.date
