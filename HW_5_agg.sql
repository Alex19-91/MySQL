/*Подсчитайте средний возраст пользователей в таблице users.


Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.

(по желанию) Подсчитайте произведение чисел в столбце таблицы.



drop database if exists db_1;
create database db_1;
use db_1;

drop table if exists users;
create table users(
	id serial primary key,
	age int,
	name varchar(23)
);


insert into users (id, age, name) values
	(1, 2, 'John'),
	(2, 34, 'Jack'),
	(3, 12, 'Ann'),
	(4, 15, 'Hannah'),
	(5, 18, 'Eugene'),
	(6, 24, 'Mattew'),
	(7, 20, 'Fillmore'),
	(8, 52, 'Jason')
;

select avg(age) as 'вот тебе средни возраст' from users 
;
*/

drop database if exists o;
create database o;
use o;
drop table if exists p;
create table p(
	id serial primary key,
	value int
);
insert into p (value) values 
(1),(2),(3);
select exp(sum(ln(value))) from p;