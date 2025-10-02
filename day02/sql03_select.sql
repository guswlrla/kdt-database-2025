-- 모든 도서의 이름과 가격을 검색
select bookname, price
from book;

-- 모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색
select bookid, bookname, publisher, price
from book;

-- 도서 테이블에 있는 모든 출판사를 검색
select publisher
from book;

-- 가격이 20,000원 미만인 도서를 검색
select bookname
from book
where price < 20000;

-- 가격이 10,000원 이상 20,000원 이하인 도서를 검색
select *
from book
where price >= 10000 and price <= 20000;

-- 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색
select *
from book
where publisher='굿스포츠' or publisher='대한미디어'; -- IN 써도 됨 ex) publisher in ('굿스포츠', '대한미디어');

-- '축구의 역사'를 출간한 출판사를 검색
select publisher
from book
where bookname='축구의 역사';

-- 도서이름에 '축구'가 포함된 출판사를 검색
select publisher
from book
where bookname like '%축구%';

-- 도서이름의 왼쪽 두 번째 위치에 '구'라는 문자열을 갖는 도서를 검색
select *
from book
where bookname like '_구%';

-- 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색
select * 
from book
where bookname like '%축구%' and price >= 20000;

-- 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색
select *
from book
where publisher in ('굿스포츠', '대한미디어');

-- 도서를 이름순으로 검색
select *
from book
order by bookname;

-- 도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색
select *
from book
order by price, bookname;

-- 도서를 가격의 내림차순으로 검색하고, 가격이 같다면 출판사를 오름차순으로 출력
select *
from book
order by price desc, publisher asc;

