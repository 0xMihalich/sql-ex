/*
Задание: 41 (Serge I: 2019-05-31)
Для каждого производителя, у которого присутствуют модели хотя бы в одной из таблиц PC, Laptop или Printer,
определить максимальную цену на его продукцию.
Вывод: имя производителя, если среди цен на продукцию данного производителя присутствует NULL, то выводить для этого производителя NULL,
иначе максимальную цену.
*/
SELECT DISTINCT p.maker maker,
       CASE WHEN MAX(CASE WHEN t.price IS NULL
	                      THEN 1
					 ELSE 0
					  END) = 0
			THEN MAX(t.price)
			END m_price
  FROM (select model,
               price
		  from PC
         union
        select model,
		       price
		  from Laptop
         union
        select model,
		       price
		  from Printer) t
  LEFT JOIN Product p
    ON (p.model = t.model)
 GROUP BY p.maker
