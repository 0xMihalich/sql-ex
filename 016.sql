/*
Задание: 16 (Serge I: 2003-02-03)
Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
*/
SELECT DISTINCT p1.model,
       p2.model,
       p1.speed,
       p1.ram
  FROM pc p1
  JOIN pc p2
    ON p1.speed = p2.speed
   AND p1.ram = p2.ram
   AND p1.model > p2.model
