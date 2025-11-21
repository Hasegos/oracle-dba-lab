-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 4)
-- 문제 : 서울에 위치한 식당 목록 출력하기
-- 핵심 내용 : 1. REST_INFO 와 REST_REVIEW 테이블 조인
--            2. 주소가 '서울'로 시작하는 식당만 필터링
--            3. 리뷰 점수(REVIEW_SCORE)의 평균값을 소수 둘째 자리까지 ROUND
--            4. 평균 점수 내림차순, 동일 점수일 경우 FAVORITES 내림차순 정렬
-- 해결방안 : REST_ID 기준으로 두 테이블을 JOIN 한 뒤
--            WHERE address LIKE '서울%' 조건으로 지역 필터링
--            GROUP BY 로 레스토랑별 집계 후 ROUND(AVG(review_score),2) 로 평균 평점 계산
--            ORDER BY SCORE DESC, FAVORITES DESC 로 정렬하여 평점과 찜 많은 식당 우선순위로 출력
-- ----------------------------------------------------------------------

-- ----------------------------------------------------------------------
-- 1. 테이블 및 컬럼 정의 (CREATE TABLE)
-- ----------------------------------------------------------------------
CREATE TABLE REST_INFO (
    REST_ID	VARCHAR(5)	NOT NULL,
    REST_NAME	VARCHAR(50)	NOT NULL,
    FOOD_TYPE	VARCHAR(20),
    VIEWS	NUMBER,
    FAVORITES	NUMBER,
    PARKING_LOT	VARCHAR(1),
    ADDRESS	VARCHAR(100),
    TEL	VARCHAR(100)
);

CREATE TABLE REST_REVIEW  (
    REVIEW_ID	VARCHAR(10)	NOT NULL,
    REST_ID	VARCHAR(10),
    MEMBER_ID	VARCHAR(100),
    REVIEW_SCORE	NUMBER,
    REVIEW_TEXT	VARCHAR(1000),
    REVIEW_DATE	DATE
);

-- ----------------------------------------------------------------------
-- 2. 테스트 데이터 삽입 (INSERT)
-- ----------------------------------------------------------------------
INSERT INTO REST_INFO (REST_ID, REST_NAME, FOOD_TYPE, VIEWS, FAVORITES, PARKING_LOT, ADDRESS, TEL)
VALUES ('00028', '대우부대찌개', '한식', 52310, 10, 'N', '경기도 용인시 처인구 남사읍 처인성로 309', '031-235-1235');
INSERT INTO REST_INFO (REST_ID, REST_NAME, FOOD_TYPE, VIEWS, FAVORITES, PARKING_LOT, ADDRESS, TEL)
VALUES ('00039', '광주식당', '한식', 23001, 20, 'N', '경기도 부천시 산업로8번길 60', '031-235-6423');
INSERT INTO REST_INFO (REST_ID, REST_NAME, FOOD_TYPE, VIEWS, FAVORITES, PARKING_LOT, ADDRESS, TEL)
VALUES ('00035', '삼촌식당', '일식', 532123, 80, 'N', '서울특별시 강서구 가로공원로76가길', '02-135-1');

INSERT INTO REST_REVIEW (REVIEW_ID, REST_ID, MEMBER_ID, REVIEW_SCORE, REVIEW_TEXT, REVIEW_DATE)
VALUES ('R000000065', '00028', 'soobin97@naver.com', 5, '부찌 국물에서 샤브샤브 맛이나고 깔끔', TO_DATE('2022-04-12', 'YYYY-MM-DD'));
INSERT INTO REST_REVIEW (REVIEW_ID, REST_ID, MEMBER_ID, REVIEW_SCORE, REVIEW_TEXT, REVIEW_DATE)
VALUES ('R000000066', '00039', 'yelin1130@gmail.com', 5, '김치찌개 최곱니다.', TO_DATE('2022-02-12', 'YYYY-MM-DD'));
INSERT INTO REST_REVIEW (REVIEW_ID, REST_ID, MEMBER_ID, REVIEW_SCORE, REVIEW_TEXT, REVIEW_DATE)
VALUES ('R000000067', '00028', 'yelin1130@gmail.com', 5, '햄이 많아서 좋아요', TO_DATE('2022-02-22', 'YYYY-MM-DD'));
INSERT INTO REST_REVIEW (REVIEW_ID, REST_ID, MEMBER_ID, REVIEW_SCORE, REVIEW_TEXT, REVIEW_DATE)
VALUES ('R000000068', '00035', 'ksyi0316@gmail.com', 5, '숙성회가 끝내줍니다.', TO_DATE('2022-02-15', 'YYYY-MM-DD'));
INSERT INTO REST_REVIEW (REVIEW_ID, REST_ID, MEMBER_ID, REVIEW_SCORE, REVIEW_TEXT, REVIEW_DATE)
VALUES ('R000000069', '00035', 'yoonsy95@naver.com', 4, '비린내가 전혀없어요.', TO_DATE('2022-04-16', 'YYYY-MM-DD'));

-- 테스트 데이터 확인
Select * FROM REST_INFO;
Select * FROM REST_REVIEW;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT
    A.REST_ID,
    A.REST_NAME,
    A.FOOD_TYPE,
    A.FAVORITES,
    A.ADDRESS,
    ROUND(AVG(B.REVIEW_SCORE),2) as SCORE
    FROM REST_INFO A JOIN REST_REVIEW B 
    ON A.REST_ID = B.REST_ID
    WHERE address LIKE '서울%'
    GROUP BY 
            A.REST_ID,
            A.REST_NAME,
            A.FOOD_TYPE,
            A.FAVORITES,
            A.ADDRESS
    ORDER BY SCORE DESC,
            A.FAVORITES DESC;

-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE REST_INFO;
DROP TABLE REST_REVIEW;