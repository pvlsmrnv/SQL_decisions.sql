--Таблица, к которой будут производиться запросы выглядит следующим образом:

/*+---------+-----------------------+------------------+--------+--------+
  | book_id | title                 | author           | price  | amount |
  +---------+-----------------------+------------------+--------+--------+
  | 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
  | 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 5      |
  | 3       | Идиот                 | Достоевский Ф.М. | 460.00 | 10     |
  | 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 2      |
  | 5       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
  +---------+-----------------------+------------------+--------+--------+*/

--Задание 1: Выбрать все записи таблицы book.
--Запрос: 
  SELECT * 
  FROM book
  ;

--Задание 2: Выбрать авторов, название книг и их цену из таблицы book.
--Запрос:
  SELECT
    author,
    title,
    price
  FROM book
  ;

--Задание 3: Выбрать все названия книг и их количества из таблицы book , для столбца title задать новое имя Название.
--Запрос:
  SELECT
    title AS Название,
    author AS Автор
  FROM book
  ;

--Задание 4: Вывести всю информацию о книгах, а также для каждой позиции посчитать ее стоимость (произведение цены на количество). Вычисляемому столбцу дать имя total.
--Запрос:
  SELECT 
    title,
    amount,
    amount*1.65 AS pack
  FROM book
  ;

/*Задание 5: В конце года цену всех книг на складе пересчитывают – снижают ее на 30%. Написать SQL запрос,
который из таблицы book выбирает названия, авторов, количества и вычисляет новые цены книг. Столбец с новой ценой назвать new_price, цену округлить до 2-х знаков после запятой.*/
--Запрос:
  SELECT
    title,
    author,
    amount,
    ROUND(0.7*price, 2) AS new_price
  FROM book
  ;

/*Задание 6: При анализе продаж книг выяснилось, что наибольшей популярностью пользуются книги Михаила Булгакова, на втором месте книги Сергея Есенина.
Исходя из этого решили поднять цену книг Булгакова на 10%, а цену книг Есенина - на 5%. Написать запрос, куда включить автора, название книги и новую цену,
последний столбец назвать new_price. Значение округлить до двух знаков после запятой.*/
--Запрос:
  SELECT
    author,
    title,
    ROUND(IF(author = 'Булгаков М.А.', 1.1*price, IF(author = 'Есенин С.А.', 1.05*price, price)), 2) AS new_price
  FROM book
  ;

--Задание 7: Вывести автора, название  и цены тех книг, количество которых меньше 10.
--Запрос: 
  SELECT
    author,
    title,
    price
  FROM book
  WHERE amount < 10
  ;

--Задание 8: Вывести название, автора,  цену  и количество всех книг, цена которых меньше 500 или больше 600, а стоимость всех экземпляров этих книг больше или равна 5000.
--Запрос:
  SELECT
    title,
    author,
    price,
    amount
  FROM book
  WHERE (price < 500 OR price > 600) AND price*amount > 5000
  ;

--Задание 9: Вывести название и авторов тех книг, цены которых принадлежат интервалу от 540.50 до 800 (включая границы),  а количество или 2, или 3, или 5, или 7.
--Запрос:
  SELECT
    title,
    author
  FROM book
  WHERE price BETWEEN 540.50 AND 800 AND amount IN (2, 3, 5, 7)
  ;

/*Задание 10: Вывести  автора и название  книг, количество которых принадлежит интервалу от 2 до 14 (включая границы).
Информацию  отсортировать сначала по авторам (в обратном алфавитном порядке), а затем по названиям книг (по алфавиту)*/
--Запрос:
  SELECT
    author,
    title
  FROM book
  WHERE amount BETWEEN 2 AND 14
  ORDER BY author DESC, title
  ;

/*Задание 11: Вывести название и автора тех книг, название которых состоит из двух и более слов, а инициалы автора содержат букву «С».
Считать, что в названии слова отделяются друг от друга пробелами и не содержат знаков препинания, между фамилией автора и инициалами обязателен пробел,
инициалы записываются без пробела в формате: буква, точка, буква, точка. Информацию отсортировать по названию книги в алфавитном порядке.*/
--Запрос:
  SELECT
    title,
    author 
  FROM book
  WHERE title LIKE '_% %' AND author LIKE '%С.%'
  ORDER BY title
  ;
