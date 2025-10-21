use sakila;

-- 매장별 직원 목록
select *
from staff stf, store str
where stf.store_id = str.store_id;

-- 위와 똑같음
SELECT *
FROM staff stf JOIN store str 
ON stf.store_id = str.store_id;

-- 카테고리가 sci-fi인 영화 목록
select *
from category c join film_category fc
on c.category_id = fc.category_id
join film f
on f.film_id = fc.film_id
where c.name = 'sci-fi';

-- 스토어 1의 재고 목록
select f.*
from store s join inventory i
on s.store_id = i.store_id
join film f
on i.film_id = f.film_id
where s.store_id = 1;

-- 가장 최근 렌탈 정보
select *
from rental
order by rental_date desc
limit 1;