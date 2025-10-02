-- book 테이블에 새로운 도서 '스포츠 의학'을 삽입하고, 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 90,000원이다
-- 속성의 이름 생략 가능(단, 속성의 순서와 일치해야 함)
insert into book(bookid, bookname, publisher, price) values(11, '스포츠 의학', '한솔의학서적', 90000);

-- book 테이블에 새로운 도서 '스포츠 의학'을 삽입, 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 미정
insert into book(bookid, bookname, publisher) values(12, '스포츠 의학', '한솔의학서적');

-- 수입도서 목록(Imported_book)을 book 테이블에 모두 삽입
insert into book(bookid, bookname, price, publisher) 
	select bookid, bookname, price, publisher
    from imported_book;
    
-- customer 테이블에서 고객번호가 5인 고객의 주소를 '대한민국 부산'으로 변경
update customer set address='대한민국 부산' where custid = 5;

-- book 테이블에서 11번 '스포츠 의학'의 출판사를 imported_book 테이블에 있는 21번 책의 출판사와 동일하게 변경
update book set publisher=(select publisher from imported_book where bookid = 21) where bookid = 11;

-- book 테이블에서 도서번호가 12인 도서를 삭제
delete from book where bookid=12;

-- 모든 고객을 삭제
delete from customer;