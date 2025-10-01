# kdt-database-2025
부산대 k-digital training 데이터베이스 학습 리포지토리

## :white_check_mark: 1일차
### 데이터 조작어(DML)
- 데이터를 검색(`SELECT`), 삽입(`INSERT`), 수정(`UPDATE`), 삭제(`DELETE`)하는 데 사용
- SELECT문 문장 프레임워크
    
    ```sql
    SELECT 속성 이름
    FROM 테이블 이름
    WHERE 검색 조건;
    ```
- INSERT문 명령어

     ```sql
    INSERT INTO 테이블 이름 [(속성리스트)] VALUES (값 리스트);
    ```
- UPDATE문 명령어

     ```sql
    UPDATE 테이블 이름
    SET 속성 이름1 = 값1[, 속성 이름2 = 값2, ...]
    [WHERE <검색 조건>];
    ```
- DELETE문 명령어

    ```sql
    DELETE FROM 테이블 이름 [WHERE 검색조건];
    ```



