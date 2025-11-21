-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 1)
-- 문제 : 여러 기준으로 정렬하기
-- 핵심 내용 : 1. ANIMAL_INS 테이블에서 ANIMAL_ID, NAME, DATETIME 조회
--            2. NAME 오름차순 정렬, 이름이 같을 경우 DATETIME 내림차순 정렬
-- 해결방안 : SELECT로 세 컬럼을 추출하고
--            ORDER BY NAME ASC, DATETIME DESC 조건을 적용하여 정렬
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
VALUES ('A349996', 'Cat', TO_DATE('2018-01-22 14:32:00', 'YYYY-MM-DD HH24:MI:SS'), 'Normal', 'Sugar', 'Neutered Male');
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
VALUES ('A350276', 'Cat', TO_DATE('2017-08-13 13:50:00', 'YYYY-MM-DD HH24:MI:SS'), 'Normal', 'Jewel', 'Spayed Female');
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
VALUES ('A396810', 'Dog', TO_DATE('2016-08-22 16:13:00', 'YYYY-MM-DD HH24:MI:SS'), 'Injured', 'Raven', 'Spayed Female');
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
VALUES ('A410668', 'Cat', TO_DATE('2015-11-19 13:41:00', 'YYYY-MM-DD HH24:MI:SS'), 'Normal', 'Raven', 'Spayed Female');

-- 테스트 데이터 확인
Select * FROM ANIMAL_INS;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT
    ANIMAL_ID,
    NAME,
    DATETIME
    FROM ANIMAL_INS 
    ORDER BY NAME ASC,
            DATETIME DESC;

-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE ANIMAL_INS;              