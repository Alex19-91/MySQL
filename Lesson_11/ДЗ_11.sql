/* 1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, 
 catalogs и products в таблицу logs помещается время и дата создания записи, название таблицы,
 идентификатор первичного ключа и содержимое поля name.
*/
--  Исходник кода - source05.zip (БД shop)
USE shop;


DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	created_at DATETIME NOT NULL,
	table_name VARCHAR(45) NOT NULL,
	str_id BIGINT(20) NOT NULL,
	name_value VARCHAR(45) NOT NULL
) ENGINE = ARCHIVE;



DROP TRIGGER IF EXISTS log_users;
delimiter //
CREATE TRIGGER log_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'users', NEW.id, NEW.name);
END //
delimiter ;

DROP TRIGGER IF EXISTS log_catalogs;
delimiter //
CREATE TRIGGER log_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END //
delimiter ;

DROP TRIGGER IF EXISTS log_ptoducts;
delimiter //
CREATE TRIGGER log_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END //
delimiter ;



SELECT * FROM users;
SELECT * FROM logs;





INSERT INTO users (name, birthday_at)
VALUES  ('Алексей', '1994-01-01');
		('Антон', '1993-01-01'),
		('Святослав', '1992-01-01'),
		('Хаджи-Умар', '1991-01-01'),
		('Василий', '1990-00-01');

SELECT * FROM users;
SELECT * FROM logs;




INSERT INTO catalogs (name)
VALUES ('Змеевики'),
		('Дрожжи'),
		('Сахар');

SELECT * FROM catalogs;
SELECT * FROM logs;



SELECT * FROM products;
SELECT * FROM logs;

INSERT INTO products (name, description, price, catalog_id)
VALUES ('4-х метровый', 'Для первака', 3000.00, 13),
		('Обычные', 'Для скучного вторника', 500.00, 14),
		('Рафинад', 'Другого нет', 150.00, 15);

SELECT * FROM products;
SELECT * FROM logs;


--  2.  Создайте SQL-запрос, который помещает в таблицу users миллион записей.


DROP TABLE IF EXISTS test_users; 
CREATE TABLE test_users (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	birthday_at DATE,
	`created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
 	`updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


DROP PROCEDURE IF EXISTS insert_into_users ;
delimiter //
CREATE PROCEDURE insert_into_users ()
BEGIN
	DECLARE i INT DEFAULT 1000000;  -- Здесь я попробовал 10000 записей, заняло немало времени. Миллион тестить не стал
	DECLARE j INT DEFAULT 0;
	WHILE i > 0 DO
		INSERT INTO test_users(name, birthday_at) VALUES (CONCAT('user_', j), NOW());
		SET j = j + 1;
		SET i = i - 1;
	END WHILE;
END //
delimiter ;



SELECT * FROM test_users;

CALL insert_into_users();

SELECT * FROM test_users LIMIT 3;