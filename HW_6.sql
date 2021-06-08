use vk;
/*Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.

Определить кто больше поставил лайков (всего): мужчины или женщины.

*/

select count(from_user_id) as 'самый частопишущий друг' from messages where to_user_id = 5
group by from_user_id 
order by count(*) desc limit 2
; 




select count(*) as 'Сумма лайков тем, кому меньше 10' 
from likes where media_id in (
	select id from media where user_id in (
		select id from users where id in (
			select user_id from profiles where YEAR(CURRENT_DATE) - YEAR(birthday) <10))) 
;  

select 
count(*) as 'Likes by males' from likes where user_id in (select id from users where id in (select user_id from profiles where gender= 'm'));
select
count(*) as 'Likes by females' from likes where user_id in (select id from users where id in (select user_id from profiles where gender= 'f'));
