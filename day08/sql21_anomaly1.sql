-- 트랜잭션 실행
start transaction;

-- 200번 학생의 계절학기 수강신청을 취소하시오.
/* c강좌 수강료를 조회하면 10,000d원으로 나옴 */
select price 'c 수강료'
from summer
where class like 'c%';

/* 200번 학생의 수강신청을 취소하였다. */
set sql_safe_updates = 0; /* delete, update 연산에 필요한 설정문 */
delete from summer
where sid=200;

/* c강좌 수강료를 다시 조회하면 조회되지 않는다. */
select price 'c수강료'
from summer
where class like 'c%';

-- 트랜잭션 실행한 때로 돌아감
rollback;

start transaction;

-- 계절학기에 새로운 강좌 c++을 개설하시오.
/* c++ 강좌를 삽입한다. */
insert into summer values (null, 'c++', 25000);

/* summer 테이블 전체를 조회해본다. */
select *
from summer;

/* null값이 있는 경우 질의에 주의 - 투플은 5개이지만 수강 학생은 총 4명이다. */
select count(*) '수강인원'
from summer;

select count(sid) '수강인원'
from summer;

select count(*) '수강인원'
from summer
where sid is not null;

rollback;

start transaction;

-- java 강좌의 수강료를 20,000원에서 15,000원으로 수정하시오.
/* java 강좌 수강료를 수정하면 java강좌 수강료 전체가 정상적으로 수정된다. */
update summer set price=15000 where class='java';

select *
from summer;

/* java 강좌를 조회하면 같은 값이 2번 조회되므로 distinct문을 사용 */
select distinct price 'java 수강료'
from summer
where class like 'java';

rollback;

start transaction;

/* update문을 다음과 같이 조건부로 작성하면 데이터 불일치 문제가 발생 */
update summer
set price=15000
where class like 'java' and sid=100;

/* summer 테이블을 조회해보면 java 강좌의 수강료가 1건만 수정됨 */
select *
from summer;

/* java 수강료를 조회하면 두 건이 나와 데이터 불일치 문제가 발생 */
select price 'java 수강료'
from summer
where class like 'java';

rollback;