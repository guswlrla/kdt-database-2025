-- 고객별
select name, count(*), ifnull(sum(saleprice), 0) 
from orders, customer
where orders.custid = customer.custid
group by orders.custid;

-- 출판사별
select b.publisher, count(*), ifnull(sum(o.saleprice), 0)
from orders o, book b
where o.bookid = b.bookid
group by b.publisher;

-- 조건없이 select 하면 카티션 프로덕트 연산이 됨 (위험한 쿼리)
select *
from orders, customer, book;

-- 고객과 고객의 주문에 관한 데이터를 모두 나타내시오.
select *
from customer, orders
where customer.custid = orders.custid;

-- 위의 코드와 같음
select *
from customer c inner join orders o 
on c.custid = o.custid;

-- 고객과 고객의 주문에 관한 데이터를 고객별로 정렬하여 나타내시오.
select *
from customer, orders
where customer.custid = orders.custid
order by customer.custid;

-- 고객별로 주문한 모든 도서의 총판매액을 구하고, 고객별로 정렬하시오.
select name, ifnull(sum(saleprice), 0) 
from customer, orders
where customer.custid = orders.custid
group by customer.custid
order by customer.name;

-- 고객의 이름과 고객이 주문한 도서의 이름을 구하시오.
select customer.name, book.bookname
from customer, book, orders
where customer.custid = orders.custid and orders.bookid = book.bookid;

-- 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오.
select customer.name, book.bookname
from customer, book, orders
where customer.custid = orders.custid and orders.bookid = book.bookid and book.price = 20000;

-- 도서를 구매하지 않은 고객을 포함해 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오.
select c.name, o.saleprice
from customer c left outer join orders o
on c.custid = o.custid;