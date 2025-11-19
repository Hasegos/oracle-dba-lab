-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 1)
-- 문제 : 평균 일일 대여 요금 구하기
-- 핵심 내용 : CAR_TYPE 'SUV' 이고 DAILY_FEE의 평균값을 소수점 첫번째 자리에서 반올림
-- ----------------------------------------------------------------------

-- ----------------------------------------------------------------------
-- 1. 테이블 및 컬럼 정의 (CREATE TABLE)
-- ----------------------------------------------------------------------
CREATE TABLE CAR_RENTAL_COMPANY_CAR(
    CAR_ID INTEGER NOT NULL,
    CAR_TYPE VARCHAR(255) NOT NULL,
    DAILY_FEE INTEGER NOT NULL,
    OPTIONS VARCHAR(255) NOT NULL
);    

-- ----------------------------------------------------------------------
-- 2. 테스트 데이터 삽입 (INSERT)
-- ----------------------------------------------------------------------
INSERT INTO CAR_RENTAL_COMPANY_CAR(CAR_ID, CAR_TYPE, DAILY_FEE,OPTIONS) VALUES (1, '세단', 16000, '가죽시트,열선시트,후방카메라'); 
INSERT INTO CAR_RENTAL_COMPANY_CAR(CAR_ID, CAR_TYPE, DAILY_FEE,OPTIONS) VALUES (2, 'SUV', 14000, '스마트키,네비게이션,열선시트'); 
INSERT INTO CAR_RENTAL_COMPANY_CAR(CAR_ID, CAR_TYPE, DAILY_FEE,OPTIONS) VALUES (3, 'SUV', 22000, '주차감지센서,후방카메라,가죽시트'); 

-- 테스트 데이터 확인
select * from CAR_RENTAL_COMPANY_CAR;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT ROUND(AVG(DAILY_FEE),0) as AVERAGE_FEE -- DAILY_FEE의 평균값의 소수점 첫째자리 반올림
    FROM CAR_RENTAL_COMPANY_CAR
    WHERE CAR_TYPE = 'SUV'; -- CAR_TYPE이 SUV일때

-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE CAR_RENTAL_COMPANY_CAR;