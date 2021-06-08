/*Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

Выведите список товаров products и разделов catalogs, который соответствует товару.

(по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
	Поля from, to и label содержат английские названия городов, поле name — русское. 
	Выведите список рейсов flights с русскими названиями городов.
*/

use store;

select name from users where id in(select user_id from orders );

select 
	id,
	name,
	(select name from catalogs where products.catalog_id=id) as 'Категория товара'
from products;

DROP database IF EXISTS airport;
CREATE database airport;
use airport;


drop table if exists flights;
create table flights(
	id serial primary key,
	from_city varchar(23),
	to_city varchar(23)
);

drop table if exists cities;
create table cities(
	label varchar(23),
	name varchar(23)
);

insert into flights (from_city, to_city) values
	('Moscow','Omsk'),
	('Novgorod','Kazan'),
	('Irkutsk','Moscow'),
	('Omsk','Irkutsk'),
	('Moscow','Kazan')
;

insert into cities (label, name) values
	('Moscow','Москва'),
	('Omsk','Омск'),
	('Novgorod','Новгород'),
	('Kazan','Казань'),
	('Irkutsk','Иркутск')
;
	
select 
	id,
	(select name from cities where flights.from_city = label) as 'Город вылета (по-русски)',
	(select name from cities where flights.to_city = label) as 'Город прибытия (по-русски)'
from flights ;

