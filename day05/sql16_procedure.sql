-- procedure 실행
CALL `madangdb`.`dorepeat`(3);
select @x; 

-- function 호출
select do_repeat2(3); 

select *
from book
where bookid = do_repeat2(3);
