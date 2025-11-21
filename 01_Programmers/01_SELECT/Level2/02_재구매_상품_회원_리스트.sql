-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 2)
-- 문제 : 재구매가 일어난 상품과 회원 리스트 구하기
-- 핵심 내용 : 1. USER_ID 와 PRODUCT_ID 조합이 2회 이상 등장한 경우만 조회
--            2. GROUP BY 로 사용자·상품별 집계
--            3. HAVING COUNT(*) > 1 조건으로 다회 구매 필터링
--            4. USER_ID 오름차순, PRODUCT_ID 내림차순 정렬
-- 해결방안 : ONLINE_SALE 테이블 데이터를 USER_ID, PRODUCT_ID 기준으로 그룹화하고
--            HAVING COUNT(*) > 1 조건을 통해 동일 상품을 2번 이상 구매한 사용자만 추출
--            ORDER BY USER_ID ASC, PRODUCT_ID DESC 정렬 후 결과 출력
-- ----------------------------------------------------------------------

-- ----------------------------------------------------------------------
-- 1. 테이블 및 컬럼 정의 (CREATE TABLE)
-- ----------------------------------------------------------------------
CREATE TABLE ONLINE_SALE  (
    ONLINE_SALE_ID	INTEGER	NOT NULL,
    USER_ID	INTEGER	NOT NULL,
    PRODUCT_ID	INTEGER	NOT NULL,
    SALES_AMOUNT	INTEGER	NOT NULL,
    SALES_DATE	DATE NOT NULL
);

-- ----------------------------------------------------------------------
-- 2. 테스트 데이터 삽입 (INSERT)
-- ----------------------------------------------------------------------
INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (1, 1, 3, 2, TO_DATE('2022-02-25', 'YYYY-MM-DD'));
INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (2, 1, 4, 1, TO_DATE('2022-03-01', 'YYYY-MM-DD'));
INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (4, 2, 4, 2, TO_DATE('2022-03-12', 'YYYY-MM-DD'));
INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (3, 1, 3, 3, TO_DATE('2022-03-31', 'YYYY-MM-DD'));
INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (5, 3, 5, 1, TO_DATE('2022-04-03', 'YYYY-MM-DD'));
INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (6, 2, 4, 1, TO_DATE('2022-04-06', 'YYYY-MM-DD'));
INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (2, 1, 4, 2, TO_DATE('2022-05-11', 'YYYY-MM-DD'));

-- 테스트 데이터 확인
Select * FROM ONLINE_SALE;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT
    USER_ID,
    PRODUCT_ID
    FROM ONLINE_SALE 
    GROUP BY USER_ID, PRODUCT_ID
    HAVING  COUNT(*) > 1
    ORDER BY USER_ID ASC,
            PRODUCT_ID DESC;

-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE ONLINE_SALE;              