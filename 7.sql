/*
Задание: 7 (Serge I: 2002-11-02)
Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
*/
SELECT Product.model, price
  FROM Product, PC
 WHERE Product.maker = 'B'
   AND Product.model = PC.model
UNION
SELECT Product.model, price
  FROM Product, Laptop
 WHERE Product.maker = 'B'
   AND Product.model = Laptop.model
UNION
SELECT Product.model, price
  FROM Product, Printer
 WHERE Product.maker = 'B'
   AND Product.model = Printer.model
