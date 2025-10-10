-- 집계함수와 group by
-- select - from - where - group by - order by 순
select custid, count(*), sum(saleprice)
from orders
group by custid;

-- 고객이 주문한 도서의 총판매액을 구하시오.
select sum(saleprice)
from orders;

-- 2번 김연아 고객이 주문한 도서의 총판매액을 구하시오.
select sum(saleprice)
from orders
where custid = 2;

-- 고객이 주문한 도서의 총판매액, 평균값, 최저가, 최고가를 구하시오.
select sum(saleprice) '총판매액', avg(saleprice) '평균값', min(saleprice) '최저가', max(saleprice) '최고가'
from orders;

-- 마당서점의 도서 판매 건수를 구하시오.
select count(*)
from orders;

-- 고객별로 주문한 도서의 총수량과 총판매액을 구하시오.
select custid, count(*), sum(saleprice)
from orders
group by custid;

-- 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총수량을 구하시오.
-- 단, 2권 이상 구매한 고객에 대해서만 구하시오.
select custid, count(*) '도서수량'
from orders
where saleprice >= 8000
group by custid
having count(*) >= 2; -- group by절 결과에 나타나는 그룹을 제한
