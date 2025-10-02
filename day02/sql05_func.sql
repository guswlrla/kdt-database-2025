-- 숫자 함수
select round(3.49999); -- 반올림
select round(35.593, 2); -- (숫자, 반올림 기준 자릿수)
select ceil(35.1); -- 크거나 같은 최소 정수
select floor(35.7); -- 작거나 같은 최소 정수

-- 문자 함수
select concat('hello',', ','world!'); -- 문자열 연결
select upper('hello');
select upper(concat('hello',', ','world!')); -- 이렇게도 가능
select lpad('hello', 10, '*'); -- 지정한 문자로 채움
select replace('hello', 'h', 'a'); -- 원하는 문자로 변경
select substr('hello', 2, 2); -- 지정된 자리부터 길이만큼 반환, substr(자리수, 길이)
select substr('안녕하세요', 2, 2); 
select length('안녕하세요'); -- 문자열의 byte 반환(영어는 1byte, 한글은 3byte)
select char_length('안녕하세요'); -- 실제 문자 개수 반환
select trim('  안녕하세요. 반가워요   '); -- 양쪽 공백 제거

-- 날짜, 시간 함수
select *
from orders
where orderdate = '2024-07-03'; -- 이렇게 쓰지 x

-- str_to_date() - 문자열 데이터를 날짜형(date)으로 반환
select *
from orders
where orderdate = str_to_date('2024-07-03', '%Y-%m-%d'); -- 데이터타입은 date

select str_to_date('2024-07-03', '%Y-%m-%d'); -- 포맷이 일치해야 함

-- date_format() - 날짜형 데이터를 문자열로 반환, 포맷 변경 가능
select date_format(orderdate, '%Y.%m.%d') -- 데이터타입은 string
from orders;

-- adddate() - 지정한 시간만큼 더함
select orderdate, adddate(orderdate, 1) 
from orders;

select adddate(curdate(), 100); 

-- datediff() - (date1 - date2)의 날짜 차이 반환
select datediff('2025-09-30', now()) -- string을 date타입으로 자동 변환 해줌
from orders;