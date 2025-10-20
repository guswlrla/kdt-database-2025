select *
from staff s1, store s2
where s1.store_id = s2.store_id;

select *
from category 
where name = 'sci-fi';

select *
from category c, film_category fc, film f
where c.name = 'sci-fi'
and fc.category_id = c.category_id
and f.film_id = fc.film_id;

select *
from store s, inventory i, film f
where s.store_id = 1
and i.store_id = s.store_id
and f.film_id = i.film_id
order by f.film_id;

select *
from (select *
	from rental
	order by rental_id desc
	limit 1) r, customer c, payment p, staff s, inventory i, film f
where r.customer_id = c.customer_id
and r.rental_id = p.payment_id
and r.staff_id = s.staff_id
and r.inventory_id = i.inventory_id
and i.film_id = f.film_id;

select *
from customer_list;

select inventory_in_stock(1);

select inventory_held_by_customer(1);

set @x = 0;
CALL `sakila`.`film_in_stock`(1, 1, @x);
select @x;
