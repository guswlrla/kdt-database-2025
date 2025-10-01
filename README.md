# kdt-database-2025
부산대 k-digital training 데이터베이스 학습 리포지토리

## :white_check_mark: 1일차
### 데이터 조작어(DML)
- 데이터를 검색(`select`), 삽입(`insert`), 수정(`update`), 삭제(`delete`)하는 데 사용
- select문의 문장 프레임워크
    
    ```sql
    select 속성 이름
    from 테이블 이름
    where 검색 조건;
    ```
- insert문 명령어

     ```sql
    insert into 테이블 이름 [(속성리스트)] values (값 리스트);
    ```
- update문 명령어

     ```sql
    update 테이블 이름
    set 속성 이름1 = 값1[, 속성 이름2 = 값2, ...]
    [where <검색 조건>];
    ```
- delete문 명령어

    ```sql
    delete from 테이블 이름 [where 검색조건];
    ```



