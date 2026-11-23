--1--
--Выведите названия всех фильмов и стоимость проката (rental_rate), которые можно взять менее чем за 3 доллара. 
--Отсортируйте результат по возрастанию цены.--
select f.title, f.rental_rate
from film as f 
where f.rental_rate < 3;
--2--
--Найдите всех актеров, в имени или фамилии которых встречается сочетание букв "man" (например, Hoffman, Newman).--
select a.first_name, a.last_name
from actor as a
where a.first_name like '%man%' or 
a.last_name like '%man%';
--3--
--Выведите список клиентов, отсортированных по фамилии. 
--Пропустите первых 10 клиентов и покажите следующих 5.--
select first_name, last_name
from actor
order by last_name 
limit 5 offset 10;
--4--
--Найдите 5 клиентов, которые потратили больше всего денег. 
--Выведите их имя, фамилию и общую сумму всех платежей. Отсортируйте по убыванию суммы.--
select c.first_name, c.last_name, sum(p.amount)
from customer as  c
inner join payment as p on p.customer_id = c.customer_id 
group by c.customer_id 
order by sum(p.amount) desc 
limit 5;
--5--
--Выведите название категории фильмов и среднюю стоимость проката для каждой категории. 
--Оставьте только те категории, где средняя стоимость проката выше 3 долларов.--
select category.name, avg(film.rental_rate)
from film
inner join film_category on film.film_id = film_category.film_id
inner join category on category.category_id = film_category.category_id
group by category.name
having avg(film.rental_rate) > 3;
--6--
--Напишите запрос, который найдет названия фильмов, которые ни разу не были взяты в прокат (отсутствуют в таблице rental). --
select distinct f.title
from film f
left join inventory i on f.film_id = i.film_id
left join rental r on i.inventory_id = r.inventory_id
where r.rental_id is null;
--7--
--Выведите имена и фамилии клиентов, которые живут в городе 'London' 
--и являются активными пользователями (active = 1).
select c.first_name, c.last_name,city.city, a.address
from customer c
inner join address a on a.address_id = c.address_id
inner join city on city.city_id = a.city_id 
where city.city = 'London' and c.active = 1;
--8--
--Определите актера, который снялся в наибольшем количестве фильмов. Выведите его имя, фамилию и количество фильмов.--
select a.first_name, a.last_name, count(f.film_id)
from actor a
inner join film_actor fa on fa.actor_id = a.actor_id 
inner join film f on f.film_id = fa.film_id 
group by a.actor_id
order by count(f.film_id) desc
limit 1;
--9--
--Для каждой страны (country) проранжируйте клиентов по общей сумме их платежей (от большего к меньшему). 
--Выведите страну, имя клиента, сумму и его место в рейтинге внутри страны. 
--Используйте RANK() или DENSE_RANK() с PARTITION BY country.
select 






