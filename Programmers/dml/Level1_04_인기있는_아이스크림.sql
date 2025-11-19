-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 1)
-- 문제 : 인기있는 아이스크림
-- 핵심 내용 : 1. 아이스크림 주문량(TOTAL_ORDER)이 높은 순으로 정렬
--            2. 주문량이 동일할 경우 출하 번호(SHIPMENT_ID) 오름차순 정렬
-- 해결방안 : FIRST_HALF 테이블에서 FLAVOR 컬럼만 조회하고
--            ORDER BY TOTAL_ORDER DESC, SHIPMENT_ID ASC 조건으로 정렬하여 출력
-- ----------------------------------------------------------------------

-- ----------------------------------------------------------------------
-- 1. 테이블 및 컬럼 정의 (CREATE TABLE)
-- ----------------------------------------------------------------------
CREATE TABLE FIRST_HALF (
    SHIPMENT_ID	NUMBER	NOT NULL,
    FLAVOR	VARCHAR(50)	NOT NULL,
    TOTAL_ORDER	NUMBER	NOT NULL
);

-- 📌 아래 CREATE/INSERT 구문은 프로그래머스 문제에서 제공된 원본 데이터 형식을 그대로 사용
-- ----------------------------------------------------------------------
-- 2. 테스트 데이터 삽입 (INSERT)
-- ----------------------------------------------------------------------
INSERT INTO FIRST_HALF VALUES (101, 'chocolate', 3200);
INSERT INTO FIRST_HALF VALUES (102, 'vanilla', 2800);
INSERT INTO FIRST_HALF VALUES (103, 'mint_chocolate', 1700);
INSERT INTO FIRST_HALF VALUES (104, 'caramel', 2600);
INSERT INTO FIRST_HALF VALUES (105, 'white_chocolate', 3100);
INSERT INTO FIRST_HALF VALUES (106, 'peach',2450);
INSERT INTO FIRST_HALF VALUES (107, 'watermelon', 2150);
INSERT INTO FIRST_HALF VALUES (108, 'mango', 2900);
INSERT INTO FIRST_HALF VALUES (109, 'strawberry', 3100);
INSERT INTO FIRST_HALF VALUES (110, 'melon', 3150);
INSERT INTO FIRST_HALF VALUES (111, 'orange', 2900);
INSERT INTO FIRST_HALF VALUES (112, 'pineapple', 2900);

-- 테스트 데이터 확인
SELECT * FROM FIRST_HALF;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT
    FLAVOR
    FROM FIRST_HALF 
    ORDER BY TOTAL_ORDER DESC,
            SHIPMENT_ID ASC;
            
-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE FIRST_HALF;