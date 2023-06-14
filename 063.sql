/*
Задание: 63 (Serge I: 2003-04-08)
Определить имена разных пассажиров, когда-либо летевших на одном и том же месте более одного раза.
*/
SELECT name
  FROM Passenger
 WHERE ID_psg in (select ID_psg
                    from Pass_in_trip
                   group by ID_psg, place
                  having count(*) > 1)
