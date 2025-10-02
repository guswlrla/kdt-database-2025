-- null값 처리
-- 숫자 + null 연산 결과는 null
-- count(*)을 제외한 집계 함수를 쓸 땐, null값 제외
select sum(price)/count(*), count(*), min(price), max(price), avg(price)
from book;

select *
from customer
where phone is null; -- null은 없는거라 값으로 비교 불가, ex) where phone = null;(x)

select *
from customer
where phone is not null;

-- ifnull(속성, 값) - 속성 값이 null이면 값으로 대체
select ifnull(phone, '번호없음')
from customer;

-- 변수 선언도 가능함
set @age = 5; -- 변수 선언
select @age; -- 출력

set @seq := 0;
select (@seq := @seq+1), bookname, price
from book;

select row_number() over (order by bookname), bookname, price -- 이렇게도 할 수 있음
from book;

select *
from book
order by price desc
limit 3; -- 이렇게도 할 수 있음