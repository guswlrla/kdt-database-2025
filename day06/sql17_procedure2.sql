-- BookInsertOrUpdate 프로시저를 실행하여 테스트하는 부분
call BookInsertOrUpdate(15, '스포츠 즐거움', '마당과학서적', 25000);

-- 15번 투플 삽입 결과 확인
select *
from book;

-- BookInsertOrUpdate 프로시저를 실행하여 테스트하는 부분
call BookInsertOrUpdate(15, '스포츠 즐거움', '마당과학서적', 20000);

-- 15번 투플 가격 변경 확인
select *
from book;

-- 프로시저 Averageprice를 테스트하는 부분
call Averageprice(@myValue);
select @myValue;