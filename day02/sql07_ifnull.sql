-- 고객이 주문한 도서의 총판매액
select sum(saleprice) -- 집계함수의 null을 조심!!!!
from orders;

-- 이런식으로 방어코드
select ifnull(sum(saleprice), 0) as totalRevenue from orders;

-- 2번 김연아 고객이 주문한 도서의 총판매액
select ifnull(sum(saleprice), 0) as 총매출
from orders
where custid=2;

-- null 조심용 연습 테이블
create table orders2
select * from orders;

select sum(saleprice), avg(saleprice) -- null 발생
from orders2;

select ifnull(sum(saleprice), 0) as sum, ifnull(avg(saleprice), 0) as avg -- 방어코드 작성
from orders2;

-- 고객이 주문한 도서의 총판매액, 평균값, 최저가, 최고가
select ifnull(sum(saleprice), 0) as total,
		ifnull(avg(saleprice), 0) as average,
        ifnull(min(saleprice), 0) as minimum,
        ifnull(max(saleprice), 0) as maximum
from orders;