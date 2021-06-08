/* 1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
*/



DELIMITER ?? 
CREATE FUNCTION time_of_day.hello()
RETURNS TEXT NOT DETERMINISTIC 
BEGIN
	DECLARE hours INT;
	SET hours = HOUR(NOW());
	CASE 
		WHEN hours between 0 and 5 then 
			RETURN  'Доброй ночи';
		WHEN hours between 6 and 11 then 
			RETURN  'Доброе утро';
		WHEN hours between 12 and 17 then 
			RETURN  'Добрый день';
		WHEN hours between 18 and 23 then 
			RETURN  'Добрый вечер';
	END CASE;
END??

DELIMITER ;

/* 2. В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
 Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема.
  Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены.
   При попытке присвоить полям NULL-значение необходимо отменить операцию.
*/
DELIMITER //
CREATE TRIGGER inserts BEFORE INSERT ON products
FOR EACH ROW BEGIN
	IF NEW name IS NULL AND NEW description IS NULL THEN
		SIGNAL SQLSTATE '45000'
		SET message_text = 'Имя и описание не несут смысловой нагрузки. Придумайте что-нибудь!'
	END IF;
END //

DELIMITER ;










