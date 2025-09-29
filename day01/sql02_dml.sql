use madangdb;

INSERT INTO book
(bookid,
bookname,
publisher,
price)
VALUES
-- (1, 'a', 'b', 100); -- 1(primary key)이 있기 때문에 오류, unique + not null
(11, 'a', 'b', 100);

UPDATE book
SET
bookname = '배고파',
publisher = '김현지',
price = 4900
WHERE bookid = 11;

DELETE FROM book
WHERE bookid = 11;