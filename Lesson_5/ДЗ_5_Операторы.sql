DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;

-- 1.Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
    firstname VARCHAR(100),
    lastname VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    month_of_birth enum ('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'),
    phone BIGINT,
    is_deleted bit default 0,
    created_at varchar(23) not null ,
    updated_at varchar(23) not null
   
);
-- Установка текущей даты и времени.
insert  into users (created_at, updated_at) values (now(), current_timestamp()) ;
-- Вывод таблицы с текущими датой и временем.
select * from users;


/* 2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них 
долгое время помещались значения в формате 20.10.2017 8:10. Необходимо преобразовать поля к типу DATETIME, 
сохранив введённые ранее значения.
*/


alter table users
	modify column created_at datetime,
	modify column updated_at datetime;
select * from users;

/*Из таблицы catalogs извлекаются записи при помощи запроса. 
SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.*/

drop database if exists alls;
create database alls;
use alls;
create table catalogs(
	id serial primary key,
	name varchar(23)
);
insert into catalogs values
	(1,'est'),(2,'amet'),(3,'quod'),(4,'veritatis'),(5,'qui');

select * from catalogs where id IN (5,1,2)
	order by CASE 
		when id = 5 then 0
		when id = 1 then 1
		when id = 2 then 2
	end;
	