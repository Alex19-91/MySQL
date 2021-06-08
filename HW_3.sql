USE vk;
/*Написать cкрипт, добавляющий в БД vk, которую создали на 3 вебинаре, 3-4 новые таблицы (с перечнем полей, указанием индексов и внешних ключей).
(по желанию: организовать все связи 1-1, 1-М, М-М)*/
drop table if exists music;
create table music(
	id serial primary key,
	name_of_track varchar(100),
	artist varchar(100),
	genre varchar(100),
	album varchar(100),
	user_id bigint unsigned not null,
	type_id bigint unsigned not null,
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (type_id) REFERENCES media_types(id)




);

drop table if exists videos;
create table videos(
	id serial primary key,
	name varchar(100),
	duration int,
	who_marked_in_video_id bigint unsigned not null,
	type_id bigint unsigned not null,
	user_id bigint unsigned not null,
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (type_id) REFERENCES media_types(id),
	FOREIGN KEY (who_marked_in_video_id) REFERENCES users(id)
	
);

drop table if exists applications;
create table applications(
	id serial primary key,
	name varchar(100),
	is_it_free bit default 1,
	user_id bigint unsigned not null,
	
	FOREIGN KEY (user_id) REFERENCES users(id)


);







