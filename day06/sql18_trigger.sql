-- 삽입한 내용을 기록하는 트리거 확인
INSERT INTO madangdb.book(bookid, bookname, publisher, price)
VALUES(14, '스포츠 과학1', '이상미디어', 25000);

select *
from book
where bookid = 14;

select *
from book_log
where book_id = 14;

-- 삽입한 내용을 트리거를 이용해 book_log 테이블에 저장
INSERT INTO madangdb.book(bookid, bookname, publisher, price)
VALUES(12, 'k-digital의 정석', '부산대학교', 1000);

update book
set price = 2000
where bookid = 12;