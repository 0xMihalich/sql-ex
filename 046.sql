/*
Задание: 46 (Serge I: 2003-02-14)
Для каждого корабля, участвовавшего в сражении при Гвадалканале (Guadalcanal), вывести название, водоизмещение и число орудий.
*/
SELECT o.ship ship,
       displacement,
	   numGuns
  FROM Outcomes o
  LEFT JOIN (SELECT name ship,
                    displacement,
			        numGuns
               FROM Ships s
		       JOIN Classes c
		         ON c.class = s.class
              UNION
             SELECT class ship,
		            displacement,
                    numGuns
               FROM Classes c) a
    ON (o.ship = a.ship)
 WHERE battle = 'Guadalcanal'
