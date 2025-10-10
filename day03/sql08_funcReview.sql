-- -78과 +78의 절댓값을 구하시오.
select abs(-78), abs(+78);

-- 4.875를 소수 첫째자리까지 반올림한 값을 구하시오.
select round(4.875, 1);

-- 고객별 평균 주문 금액을 100원 단위로 반올림한 값을 구하시오.
select custid '고객번호', round(sum(saleprice)/count(*), -2) '평균금액'
from orders
group by custid;

-- 도서 제목에 야구가 포함된 도서를 현지로 변경한 후 도서목록을 나타내시오.
select bookid, replace(bookname, '야구', '현지') bookname, publisher, price
from book;

-- 굿스포츠에서 출판한 도서의 제목과 제목의 문자 수, 바이트 수를 나타내시오.
select bookname '제목', char_length(bookname) '문자 수', length(bookname) '바이트 수'
from book
where publisher = '굿스포츠';

-- 마당서점의 고객 중에서 성이 같은 사람이 몇 명이나 되는지 알고싶다. 성별 인원수를 구하시오.
select substr(name, 1, 1) '성', count(*) '인원'
from customer
group by substr(name, 1, 1);

-- 마당서점은 주문일로부터 10일 후에 매출을 확정한다. 각 주문의 확정일자를 구하시오.
select orderid, orderdate, adddate(orderdate, interval 10 day) '확정'
from orders; 

-- 마당서점이 2024년 7월 7일에 주문받은 도서의 주문번호, 주문일, 고객번호, 도서번호를 모두 나타내시오.
-- 단, 주문일은 '%Y-%m-%d'형태로 표시한다.
select orderid, date_format(orderdate, '%Y-%m-%d') '주문일', custid, bookid
from orders
where orderdate = str_to_date('20240707', '%Y%m%d');

-- dbms 서버에 설정된 현재 날짜와 시간, 요일을 확인하시오.
select sysdate(), date_format(sysdate(), '%Y/%m/%d %a %h:%i') 'sysdate_1';

-- 이름, 전화번호가 포함된 고객 목록을 나타내시오. 단, 전화번호가 없는 고객은 '연락처 없음'으로 표시하시오.
select name '이름', ifnull(phone, '연락처 없음') '전화번호'
from customer;

-- 고객 목록에서 고객번호, 이름, 전화번호를 앞의 2명만 나타내시오.
set @seq := 0;

select (@seq := @seq+1) '순번', custid, name, phone
from customer
where @seq < 2;