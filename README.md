# kdt-database-2025
부산대 k-digital training 데이터베이스 학습 리포지토리

## :white_check_mark: 1일차
### 1. 데이터 조작어(DML)
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

### 2. ORDER BY
- 특정 속성을 기준으로 정렬하고 싶을 때 사용
- 기본은 오름차순(`ASC`), 내림차순은 (`DESC`)
    
    ```sql
    SELECT 속성1, 속성2
    FROM 테이블 이름
    WHERE 조건
    ORDER BY 속성1 [ASC|DESC], 속성2 [ASC|DESC]; -- 속성1의 값이 같을 경우, 속성2로 정렬
    ```

## :white_check_mark: 2일차
### 1. 내장 함수
<img width="1000" height="800" alt="Image" src="https://github.com/user-attachments/assets/f36c52fe-97b9-40fc-bb01-5a7f777840a7"/>

### 2. NULL값 처리
- 'NULL + 숫자' 연산 결과는 NULL
- COUNT(*)을 제외한 집계 함수를 쓸 때, **null값은 집계에서 제외**
    - IFNULL로 방어코드 작성

        ```sql
        SELECT IFNULL(SUM(saleprice), 0) AS totalRevenue FROM orders;
        ```
- NULL은 값이 없는 상태를 의미, 값으로 비교 불가(`IS NULL`, `IS NOT NULL`로 사용)

### 3. 변수 사용
- MySQL에서 변수 앞에 (`@`) 기호를 붙임
- 치환문에는 `SET`과 (`:=`) 기호 사용
    
    ```sql
    SET @seq := 0; -- 행에 번호 붙이기 가능
    SELECT (@seq := @seq+1), bookname, price
    FROM book;
    ```
## :white_check_mark: 3일차
### 1. GROUP BY
- 데이터를 그룹화하여, 각 그룹에 대해 집계 함수를 사용할 수 있게 함
- SQL 작성 순서

    ```sql
    SELECT 속성 이름
    FROM 테이블 이름
    WHERE 검색 조건
    GROUP BY 속성 이름
    HAVING 검색 조건
    ORDER BY 속성 이름;
    ```
- (`HAVING`) 절은 GROUP BY로 그룹화한 결과에 조건을 줄 때 사용
    - WHERE은 그룹화 전에 필터링, HAVING은 그룹화 후에 필터링

### 2. JOIN(조인)
- 여러 테이블을 연결해서 관계 있는 데이터를 조회할 수 있도록 함
- INNER JOIN(내부 조인)
    - 양쪽 테이블에 모두 존재하는 데이터만 조회
    - 기본 문법

        ```SQL
        SELECT 컬럼명
        FROM 테이블 A INNER JOIN 테이블 B -- INNER 생략 가능
        ON A.연결컬럼 = B.연결컬럼;
        ```
- LEFT OUTER JOIN
    - **왼쪽 테이블** 기준으로 JOIN
    - 왼쪽 테이블 A 의 모든 데이터와 A와 B 테이블의 중복데이터들이 검색됨
    - 일치하는 값이 없으면 `NULL`로 채움
    - 기본 문법

        ```SQL
        SELECT 컬럼명
        FROM 테이블 A LEFT OUTER JOIN 테이블 B -- OUTER는 생략 가능
        ON A.연결컬럼 = B.연결컬럼;
        ```
## :white_check_mark: 4일차
### 1. 서브쿼리
- 하나의 sql문 안에 다른 sql문이 중첩된 질의
- 
### 2. 연산자
### 3. DDL

## :white_check_mark: 5일차
### 1. 뷰
### 2. 인덱스


## :white_check_mark: 6일차
### 1. 프로시저
### 2. 트리거

## :white_check_mark: 7일차
### 1. er모델