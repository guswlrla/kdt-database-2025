select c.custid, c.name, c.address, c.phone,
o.orderid, o.saleprice, o.orderdate,
b.bookid, b.bookname, b.publisher, b.price
from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid;

-- 뷰 만들기
create view vorders
as select c.custid, c.name, c.address, c.phone,
o.orderid, o.saleprice, o.orderdate,
b.bookid, b.bookname, b.publisher, b.price
from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid;

-- 뷰도 일반 테이블처럼 사용가능
select *
from vorders;

select *
from vorders
where saleprice > 42000;