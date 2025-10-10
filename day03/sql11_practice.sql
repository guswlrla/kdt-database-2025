-- 01. 마당서점의 고객이 요구하는 다음 질문에 대해 sql문을 작성하시오.
-- 1. 도서번호가 1인 도서의 이름
select bookname
from book
where bookid = 1;

-- 2. 가격이 20,000원 이상인 도서의 이름
select bookname
from book
where price >= 20000;

-- 3. 박지성의 총구매액
select c.name, ifnull(sum(saleprice), 0) '총구매액'
from customer c inner join orders o
on c.custid = o.custid
where c.name = '박지성';

-- 4. 박지성이 구매한 도서의 수
select count(*)
from orders o, customer c
where o.custid = c.custid and c.name = '박지성';

-- 5. 박지성이 구매한 도서의 출판사 수
select count(distinct b.publisher) '출판사 수'
from orders o, book b, customer c
where o.custid = c.custid and o.bookid = b.bookid and c.name = '박지성';

-- 6. 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
select b.bookname, b.price, (b.price - o.saleprice) '판매가격 차이'
from orders o, customer c, book b
where o.custid = c.custid and o.bookid = b.bookid and c.name = '박지성';

-- 7. 박지성이 구매하지 않은 도서의 이름
select bookname
from book
where bookid not in (select o.bookid
					from orders o inner join customer c
                    on o.custid = c.custid
                    where c.name = '박지성');

-- 02. 마당서점의 운영자와 경영자가 요구하는 다음 질문에 대해 sql문을 작성하시오.
-- 1. 마당서점 도서의 총 개수
select count(*)
from book;

-- 2. 마당서점에 도서를 출고하는 출판사의 총개수
select count(distinct publisher) '출판사 개수'
from book;

-- 3. 모든 고객의 이름, 주소
select name, address
from customer;

-- 4. 2024년 7월 4일 ~ 7월 7일 사이에 주문받은 도서의 주문번호
select orderid
from orders
where orderdate between '20240704' and '20240707';

-- 5. 2024년 7월 4일 ~ 7월 7일 사이에 주문받은 도서를 제외한 도서의 주문번호
select orderid
from orders
where orderdate not between '20240704' and '20240707'; -- 서브쿼리 안해도 되네...

-- 6. 성이 '김'씨인 고객의 이름과 주소
select name, address
from customer
where name like '김%';

-- 7. 성이 '김'씨이고 이름이 '아'로 끝나는 고객의 이름과 주소
select name, address
from customer
where name like '김%아';

-- 8. 주문하지 않은 고객의 이름(부속질의 사용)
select name
from customer
where custid not in (select custid
						from orders);
                                                
-- 9. 주문 금액의 총액과 주문의 평균 금액
select ifnull(sum(saleprice), 0) '총액', ifnull(avg(saleprice), 0) '평균 금액'
from orders;

-- 10. 고객의 이름과 고객별 구매액
select c.name, sum(saleprice)
from orders o inner join customer c
on o.custid = c.custid
group by o.custid;

-- 11. 고객의 이름과 고객이 구매한 도서 목록
select c.name, b.bookname 
from orders o inner join customer c
on  o.custid = c.custid
inner join book b
on o.bookid = b.bookid;

-- 12. 도서의 가격(book 테이블)과 판매가격(orders 테이블)의 차이가 가장 많은 주문
select o.orderid, (b.price - o.saleprice) as 가격차이
from book b inner join orders o
on b.bookid = o.bookid
order by 가격차이 desc
limit 1;

-- 13. 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
select c.name, avg(saleprice) as 평균금액
from orders o inner join customer c
on o.custid = c.custid
group by o.custid
having avg(saleprice) > (select avg(saleprice)
						from orders);