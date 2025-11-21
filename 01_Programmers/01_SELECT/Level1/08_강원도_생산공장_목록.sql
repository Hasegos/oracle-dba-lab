-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 1)
-- 문제 : 강원도에 위치한 생산공장 목록 출력하기
-- 핵심 내용 : 1. ADDRESS가 '강원도'로 시작하는 공장 조회
--            2. FACTORY_ID 오름차순 정렬
-- 해결방안 : FOOD_FACTORY 테이블에서 ADDRESS LIKE '강원도%' 조건으로 필터링하고
--            FACTORY_ID 기준으로 오름차순 정렬하여 공장 ID·이름·주소 출력
-- ----------------------------------------------------------------------

-- ----------------------------------------------------------------------
-- 1. 테이블 및 컬럼 정의 (CREATE TABLE)
-- ----------------------------------------------------------------------
CREATE TABLE FOOD_FACTORY (
    FACTORY_ID	VARCHAR(10)	NOT NULL,
    FACTORY_NAME	VARCHAR(50)	NOT NULL,
    ADDRESS	VARCHAR(100)	NOT NULL,
    TLNO	VARCHAR(20)	
);

-- ----------------------------------------------------------------------
-- 2. 테스트 데이터 삽입 (INSERT)
-- ----------------------------------------------------------------------
INSERT INTO FOOD_FACTORY(FACTORY_ID, FACTORY_NAME, ADDRESS, TLNO) VALUES ('FT19980003', '(주)맛있는라면', '강원도 정선군 남면 칠현로 679', '033-431-3122'); 
INSERT INTO FOOD_FACTORY(FACTORY_ID, FACTORY_NAME, ADDRESS, TLNO) VALUES ('FT19980004', '(주)맛있는기름', '경기도 평택시 포승읍 포승공단순환로 245', '031-651-2410'); 
INSERT INTO FOOD_FACTORY(FACTORY_ID, FACTORY_NAME, ADDRESS, TLNO) VALUES ('FT20010001', '(주)맛있는소스', '경상북도 구미시 1공단로7길 58-11', '054-231-2121'); 
INSERT INTO FOOD_FACTORY(FACTORY_ID, FACTORY_NAME, ADDRESS, TLNO) VALUES ('FT20010002', '(주)맛있는통조림', '전라남도 영암군 미암면 곤미현로 1336', '061-341-5210'); 
INSERT INTO FOOD_FACTORY(FACTORY_ID, FACTORY_NAME, ADDRESS, TLNO) VALUES ('FT20100001', '(주)맛있는차', '전라남도 장성군 서삼면 장산리 233-1번지', '061-661-1420'); 
INSERT INTO FOOD_FACTORY(FACTORY_ID, FACTORY_NAME, ADDRESS, TLNO) VALUES ('FT20100002', '(주)맛있는김치', '충청남도 아산시 탕정면 탕정면로 485', '041-241-5421'); 
INSERT INTO FOOD_FACTORY(FACTORY_ID, FACTORY_NAME, ADDRESS, TLNO) VALUES ('FT20100003', '(주)맛있는음료', '강원도 원주시 문막읍 문막공단길 154', '033-232-7630'); 
INSERT INTO FOOD_FACTORY(FACTORY_ID, FACTORY_NAME, ADDRESS, TLNO) VALUES ('FT20100004', '(주)맛있는국', '강원도 평창군 봉평면 진조길 227-35', '033-323-6640'); 
INSERT INTO FOOD_FACTORY(FACTORY_ID, FACTORY_NAME, ADDRESS, TLNO) VALUES ('FT20110001', '(주)맛있는밥', '경기도 화성시 팔탄면 가재리 34번지', '031-661-1532'); 
INSERT INTO FOOD_FACTORY(FACTORY_ID, FACTORY_NAME, ADDRESS, TLNO) VALUES ('FT20110002', '(주)맛있는과자', '광주광역시 북구 하서로 222', '062-211-7759'); 

-- 테스트 데이터 확인
Select * FROM FOOD_FACTORY;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT
    FACTORY_ID,
    FACTORY_NAME,
    ADDRESS
    FROM FOOD_FACTORY
    WHERE ADDRESS LIKE '강원도%'
    ORDER BY FACTORY_ID ASC;

-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE FOOD_FACTORY;              