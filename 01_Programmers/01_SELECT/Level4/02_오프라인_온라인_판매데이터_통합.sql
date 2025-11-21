-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 4)
-- 문제 : 오프라인/온라인 판매 데이터 통합하기
-- 핵심 내용 : 1. ONLINE_SALE 과 OFFLINE_SALE 데이터를 결합 (UNION ALL)
--             2. SALES_DATE가 2022년 3월인 데이터만 조회
--             3. USER_ID가 없는 오프라인 판매는 USER_ID = NULL 로 출력
--             4. SALES_DATE 오름차순 → PRODUCT_ID 오름차순 → USER_ID 오름차순 정렬
-- 해결방안 : 두 테이블에서 동일한 컬럼 구조(SALES_DATE · PRODUCT_ID · USER_ID · SALES_AMOUNT)를 맞춘 후
--            WHERE 조건으로 2022년 3월 데이터만 필터링
--            UNION ALL 을 이용해 중복 제거 없이 데이터 병합
--            ORDER BY SALES_DATE, PRODUCT_ID, USER_ID 순으로 정렬해 결과 출력
--            (오라클 환경에서 날짜 필터는 TO_CHAR(SALES_DATE,'YYYY-MM') 사용)
-- ----------------------------------------------------------------------

-- ----------------------------------------------------------------------
-- 1. 테이블 및 컬럼 정의 (CREATE TABLE)
-- ----------------------------------------------------------------------
CREATE TABLE ONLINE_SALE (
    ONLINE_SALE_ID	INTEGER	NOT NULL,
    USER_ID	INTEGER	NOT NULL,
    PRODUCT_ID	INTEGER	NOT NULL,
    SALES_AMOUNT	INTEGER	NOT NULL,
    SALES_DATE	DATE NOT NULL
);

CREATE TABLE OFFLINE_SALE (
    OFFLINE_SALE_ID	INTEGER	NOT NULL,
    PRODUCT_ID	INTEGER	NOT NULL,
    SALES_AMOUNT INTEGER	NOT NULL,
    SALES_DATE	DATE NOT NULL
);

-- ----------------------------------------------------------------------
-- 2. 테스트 데이터 삽입 (INSERT)
-- ----------------------------------------------------------------------
INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (1, 1, 3, 2, TO_DATE('2022-02-25', 'YYYY-MM-DD'));
INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (2, 4, 4, 1, TO_DATE('2022-03-01', 'YYYY-MM-DD'));
INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (4, 2, 2, 2, TO_DATE('2022-03-02', 'YYYY-MM-DD'));
INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (3, 6, 3, 3, TO_DATE('2022-03-02', 'YYYY-MM-DD'));
INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (5, 5, 5, 1, TO_DATE('2022-03-03', 'YYYY-MM-DD'));
INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (6, 5, 7, 1, TO_DATE('2022-04-06', 'YYYY-MM-DD'));

INSERT INTO OFFLINE_SALE (OFFLINE_SALE_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (1, 1, 2, TO_DATE('2022-02-21', 'YYYY-MM-DD'));
INSERT INTO OFFLINE_SALE (OFFLINE_SALE_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (4, 1, 2, TO_DATE('2022-03-01', 'YYYY-MM-DD'));
INSERT INTO OFFLINE_SALE (OFFLINE_SALE_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (3, 3, 3, TO_DATE('2022-03-01', 'YYYY-MM-DD'));
INSERT INTO OFFLINE_SALE (OFFLINE_SALE_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (2, 4, 1, TO_DATE('2022-03-01', 'YYYY-MM-DD'));
INSERT INTO OFFLINE_SALE (OFFLINE_SALE_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (5, 2, 1, TO_DATE('2022-03-03', 'YYYY-MM-DD'));
INSERT INTO OFFLINE_SALE (OFFLINE_SALE_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (6, 2, 1, TO_DATE('2022-04-01', 'YYYY-MM-DD'));

-- 테스트 데이터 확인
Select * FROM ONLINE_SALE;
Select * FROM OFFLINE_SALE;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT
    TO_CHAR(SALES_DATE,'YYYY-MM-DD') as SALES_DATE,
    PRODUCT_ID,
    NVL(USER_ID,NULL) as USER_ID,
    SALES_AMOUNT
    FROM ONLINE_SALE
    WHERE TO_CHAR(SALES_DATE, 'YYYY-MM') = '2022-03'
    UNION ALL
SELECT 
    TO_CHAR(SALES_DATE,'YYYY-MM-DD') as SALES_DATE,
    PRODUCT_ID,
    NULL as USER_ID,
    SALES_AMOUNT
    FROM OFFLINE_SALE  
    WHERE TO_CHAR(SALES_DATE, 'YYYY-MM') = '2022-03'    
    ORDER BY SALES_DATE ASC,
            PRODUCT_ID ASC,
            USER_ID ASC;

-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE ONLINE_SALE;
DROP TABLE OFFLINE_SALE;