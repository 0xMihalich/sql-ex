/*
Задание: 32 (Serge I: 2003-02-17)
Одной из характеристик корабля является половина куба калибра его главных орудий (mw).
С точностью до 2 десятичных знаков определите среднее значение mw для кораблей каждой страны,
у которой есть корабли в базе данных.
*/
SELECT result.country,
       CAST(AVG((POWER(bore,3)/2)) AS NUMERIC(6,2)) as weight
  FROM (select c1.country,
               c1.class,
               c1.bore,
               s.name
        from classes c1
        left join ships s
          on c1.class=s.class
        union all
        select distinct
               c2.country,
               c2.class,
               c2.bore,
               o.ship
          from classes c2
          left join outcomes o
            on c2.class=o.ship
         where o.ship=c2.class
           and o.ship not in (select name from ships)
         ) result
  WHERE result.name IS NOT NULL
  GROUP BY result.country
