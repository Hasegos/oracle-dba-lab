-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 1)
-- 문제 : 과일로 만든 아이스크림 고르기
-- 핵심 내용 : 1. FIRST_HALF와 ICECREAM_INFO의 FLAVOR 값을 기준으로 매칭
--            2. 상반기 주문량(TOTAL_ORDER)이 3000 초과인 맛만 대상
--            3. 원재료 타입이 과일 기반(INGREDIENT_TYPE = 'fruit_based')인 아이스크림만 조회
-- 해결방안 : 두 테이블을 FLAVOR로 조인하여 조건을 만족하는 데이터만 필터링하고
--            TOTAL_ORDER 기준으로 내림차순 정렬하여 인기순으로 출력
-- ----------------------------------------------------------------------

-- ----------------------------------------------------------------------
-- 1. 테이블 및 컬럼 정의 (CREATE TABLE)
-- ----------------------------------------------------------------------
CREATE TABLE FIRST_HALF (
    SHIPMENT_ID	INTEGER	NOT NULL,
    FLAVOR	VARCHAR(50)	NOT NULL,
    TOTAL_ORDER	INTEGER	NOT NULL	
);

CREATE TABLE ICECREAM_INFO  (
    FLAVOR	VARCHAR(50)	NOT NULL,
    INGREDIENT_TYPE	VARCHAR(50)	NOT NULL	
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
INSERT INTO FIRST_HALF VALUES (106, 'peach', 2450);
INSERT INTO FIRST_HALF VALUES (107, 'watermelon', 2150);
INSERT INTO FIRST_HALF VALUES (108, 'mango', 2900);
INSERT INTO FIRST_HALF VALUES (109, 'strawberry', 3100);
INSERT INTO FIRST_HALF VALUES (110, 'melon', 3150);
INSERT INTO FIRST_HALF VALUES (111, 'orange', 2900);
INSERT INTO FIRST_HALF VALUES (112, 'pineapple', 2900);

INSERT INTO ICECREAM_INFO VALUES ('chocolate', 'sugar_based');
INSERT INTO ICECREAM_INFO VALUES ('vanilla', 'sugar_based');
INSERT INTO ICECREAM_INFO VALUES ('mint_chocolate', 'sugar_based');
INSERT INTO ICECREAM_INFO VALUES ('caramel', 'sugar_based');
INSERT INTO ICECREAM_INFO VALUES ('white_chocolate', 'sugar_based');
INSERT INTO ICECREAM_INFO VALUES ('peach', 'fruit_based');
INSERT INTO ICECREAM_INFO VALUES ('watermelon', 'fruit_based');
INSERT INTO ICECREAM_INFO VALUES ('mango', 'fruit_based');
INSERT INTO ICECREAM_INFO VALUES ('strawberry', 'fruit_based');
INSERT INTO ICECREAM_INFO VALUES ('melon', 'fruit_based');
INSERT INTO ICECREAM_INFO VALUES ('orange', 'fruit_based');
INSERT INTO ICECREAM_INFO VALUES ('pineapple', 'fruit_based');

-- 테스트 데이터 확인
SELECT * FROM FIRST_HALF;
SELECT * FROM ICECREAM_INFO;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT
    A.FLAVOR
    FROM FIRST_HALF A, ICECREAM_INFO B
    WHERE A.FLAVOR = B.FLAVOR
    AND A.TOTAL_ORDER > 3000
    AND B.INGREDIENT_TYPE = 'fruit_based'
    ORDER BY A.TOTAL_ORDER DESC;
            
-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE FIRST_HALF;
DROP TABLE ICECREAM_INFO;