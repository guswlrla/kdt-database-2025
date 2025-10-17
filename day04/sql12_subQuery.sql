-- 가장 비싼 도서의 이름을 나타내시오.
select bookname
from book
where price = (select max(price) from book);

-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오.
select name
from customer
where custid in (select custid from orders);

-- 대한미디어에서 출판한 도서를 구매한 고객의 이름을 나타내시오.
select name
from customer
where custid in (select custid
				 from orders
                 where bookid in (select bookid
								  from book
                                  where publisher = '대한미디어'));

-- 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오.
select b1.bookname
from book b1
where b1.price > (select avg(b2.price)
				  from book b2
                  where b2.publisher = b1.publisher);

-- 평균 주문금액 이하의 주문에 대해서 주문번호와 금액을 나타내시오.
select orderid, saleprice
from orders
where saleprice <= (select avg(saleprice)
					from orders);
                    
-- 각 고객의 평균 주문금액보다 큰 금액의 주문내역에 대해서 주문번호, 고객번호, 금액을 나타내시오.
select orderid, custid, saleprice
from orders o1
where saleprice > (select avg(saleprice)
				from orders o2
				where o1.custid = o2.custid);

-- ">" 연산자는 단일행만 반환하기 때문에 오류
-- select orderid, custid, saleprice
-- from orders
-- where saleprice > (select avg(saleprice)
-- 					from orders
--                     group by custid);
                
-- 대한민국에 거주하는 고객에게 판매한 도서의 총판매액을 구하시오.
select sum(saleprice)
from orders
where custid in (select custid
				from customer
                where address like '%대한민국%');
                
-- 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 판매금액을 보이시오.
select orderid, saleprice
from orders
where saleprice > all (select saleprice
						from orders
                        where custid = 3);
                        
-- exists 연산자(존재 연산자)를 사용하여 대한민국에 거주하는 고객에게 판매한 도서의 총판매액을 구하시오.
select sum(saleprice)
from orders o
where exists (select *
				from customer c
                where address like '%대한민국%' and c.custid = o.custid);
                
-- 마당서점의 고객별 판매액을 나타내시오(고객이름과 고객별 판매액 출력).
select (select name
		from customer c
        where c.custid = o.custid) 'name', sum(saleprice) 'total'
from orders o
group by o.custid;

-- orders 테이블에 각 주문에 맞는 도서이름을 입력하시오.
alter table orders add bname varchar(40);
update orders set bname = (select bookname
							from book
                            where book.bookid = orders.bookid);
                            
-- 고객번호가 2이하인 고객의 판매액을 나타내시오(고객이름과 고객별 판매액 출력).
select c.name, sum(o.saleprice)
from (select custid, name
		from customer
        where custid <= 2) c, orders o
where c.custid = o.custid
group by c.name;