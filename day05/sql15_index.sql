-- price에 index를 걸고 돌려봤음
select *
from book
where price > 5000
-- order by bookid desc -- order by 때문에 데이터를 처음부터 읽을 수 밖에 없음
limit 100;

-- primary key는 이미 인덱스가 잡혀있음
select *
from book
where bookid = 1;

-- 인덱스 생성 (실무에선 적지 않고, UI로 작업함)
-- book 테이블의 bookname 열을 대상으로 인덱스 idx_book을 생성하시오.
create index idx_book on book(bookname);

-- book 테이블의 publisher, price 열을 대상으로 인덱스 idx_book2를 생성하시오.
create index idx_book2 on book(publisher, price);