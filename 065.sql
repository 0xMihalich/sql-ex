/*
Задание: 65 (Serge I: 2009-08-24)
Пронумеровать уникальные пары {maker, type} из Product, упорядочив их следующим образом:
- имя производителя (maker) по возрастанию;
- тип продукта (type) в порядке PC, Laptop, Printer.
Если некий производитель выпускает несколько типов продукции, то выводить его имя только в первой строке;
остальные строки для ЭТОГО производителя должны содержать пустую строку символов ('').
*/
SELECT row_number() OVER(order by maker) num,
       CASE WHEN maker_num = 1
	        THEN maker
            ELSE ''
        END maker,
       type
  FROM (select row_number() over(partition by maker order by maker, ord) maker_num,
               maker,
			   type
          from (SELECT DISTINCT maker,
		               type,
					   CASE WHEN type = 'PC'
					        THEN 1
                            WHEN type = 'Laptop'
					        THEN 2
					        WHEN type = 'Printer'
					        THEN 3
                        END ord
                 FROM product) mto
               ) mtn
