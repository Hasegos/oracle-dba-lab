-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 1)
-- 문제 : 모든 레코드 조회하기
-- 핵심 내용 : 1. ANIMAL_INS 테이블에서 NAME과 DATETIME만 조회
--             2. ANIMAL_ID 기준 내림차순 정렬 (가장 최근 ID가 먼저)
-- 해결방안 : SELECT로 필요한 두 컬럼만 추출하고
--            ORDER BY ANIMAL_ID DESC 로 정렬하여 최신 ID 순서대로 출력
-- ----------------------------------------------------------------------

-- ----------------------------------------------------------------------
-- 1. 테이블 및 컬럼 정의 (CREATE TABLE)
-- ----------------------------------------------------------------------
CREATE TABLE ANIMAL_INS  (
    ANIMAL_ID	VARCHAR(50)	NOT NULL,
    ANIMAL_TYPE	VARCHAR(50)	NOT NULL,
    DATETIME	DATE	NOT NULL,
    INTAKE_CONDITION	VARCHAR(50)	NOT NULL,
    NAME	VARCHAR(50),	
    SEX_UPON_INTAKE	VARCHAR(50)	NOT NULL
);

-- ----------------------------------------------------------------------
-- 2. 테스트 데이터 삽입 (INSERT)
-- ----------------------------------------------------------------------
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
VALUES ('A400001', 'Dog', TO_DATE('2016-06-07 09:17:00', 'YYYY-MM-DD HH24:MI:SS'), 'Normal', 'Rocky', 'Neutered Male');
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
VALUES ('A400002', 'Dog', TO_DATE('2015-01-29 15:01:00', 'YYYY-MM-DD HH24:MI:SS'), 'Normal', 'Shelly', 'Neutered Male');
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
VALUES ('A400003', 'Dog', TO_DATE('2016-04-19 13:28:00', 'YYYY-MM-DD HH24:MI:SS'), 'Normal', 'Benji', 'Neutered Male');
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
VALUES ('A400004', 'Dog', TO_DATE('2016-01-03 16:25:00', 'YYYY-MM-DD HH24:MI:SS'), 'Normal', 'Jackie', 'Neutered Male');
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
VALUES ('A400005', 'Dog', TO_DATE('2016-03-13 11:17:00', 'YYYY-MM-DD HH24:MI:SS'), 'Normal', '*Sam', 'Neutered Male');

-- 테스트 데이터 확인
Select * FROM ANIMAL_INS;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT
    NAME,
    DATETIME
    FROM ANIMAL_INS 
    ORDER BY ANIMAL_ID DESC;

-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE ANIMAL_INS;              