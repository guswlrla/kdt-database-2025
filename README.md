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
| 분류          | 함수명                  | 설명                        |
|---------------|-------------------------|-----------------------------|
| 숫자 함수     | round(숫자, 자릿수 기준)| 반올림                      |
|               | ceil()                  | 올림                        |
|               | floor()                 | 내림                        |
| 문자 함수     | concat()                | 문자열 연결                 |
|               | upper(), lower()        | 대문자, 소문자로 변환       |
|               | lpad(), rpad()          | 왼쪽, 오른쪽에 문자 채우기  |
|               | replace()               | 문자열 대체                 |
|               | substr(자릿수, 길이)    | 문자열 자르기               |
|               | length(), char_length() | 문자열 길이                 |
|               | trim()                  | 앞뒤 공백 제거              |
| 날짜/시간 함수| str_to_date()           | 문자열을 날짜형으로 변환    |
|               | date_format()           | 날짜형 데이터를 문자형으로 변환|
|               | adddate()               | 날짜 더하기                 |
|               | datediff()              | 날짜 차이 계산              |
| 집계 함수     | sum(), avg(), count(), max(), min() | 합, 평균, 개수, 최대, 최소 |
| NULL 함수     | ifnull(컬럼명, 대체 값) | NULL 값을 지정한 값으로 대체 |

### 2. NULL값 처리
- 'NULL + 숫자' 연산 결과는 NULL
- COUNT(*)을 제외한 집계 함수를 쓸 때, null값은 집계에서 제외
    - IFNULL로 방어코드 작성

        ```sql
        select ifnull(sum(saleprice), 0) as totalRevenue from orders;
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