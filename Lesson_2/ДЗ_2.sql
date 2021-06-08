

/*Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name*/
DROP DATABASE  IF EXISTS example;
CREATE DATABASE example;
USE example;
drop table if exists users;
create table users(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100)
);


