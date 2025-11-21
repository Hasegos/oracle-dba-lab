-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 1)
-- 문제 : 동물의 아이디와 이름
-- 핵심 내용 : 1. ANIMAL_INS 테이블에서 모든 동물의 ID와 이름 조회
--            2. ANIMAL_ID 기준 오름차순 정렬
-- 해결방안 : SELECT로 필요한 두 컬럼만 추출하고
--            ORDER BY ANIMAL_ID ASC 로 정렬하여 ID 순서대로 출력
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
VALUES ('A349996', 'Dog', TO_DATE('2018-01-22 14:32:00', 'YYYY-MM-DD HH24:MI:SS'), 'Normal', 'Sugar', 'Neutered Male');
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
VALUES ('A350276', 'Dog', TO_DATE('2017-08-13 13:50:00', 'YYYY-MM-DD HH24:MI:SS'), 'Normal', 'Jewel', 'Neutered Male');
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
VALUES ('A350375', 'Dog', TO_DATE('2017-03-06 15:01:00', 'YYYY-MM-DD HH24:MI:SS'), 'Normal', 'Meo', 'Neutered Male');
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
VALUES ('A352555', 'Dog', TO_DATE('2014-08-08 04:20:00', 'YYYY-MM-DD HH24:MI:SS'), 'Normal', 'Harley', 'Neutered Male');
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
VALUES ('A352713', 'Dog', TO_DATE('2017-04-13 16:29:00', 'YYYY-MM-DD HH24:MI:SS'), 'Normal', 'Gia', 'Spayed Female');
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
VALUES ('A352872', 'Dog', TO_DATE('2015-07-09 17:51:00', 'YYYY-MM-DD HH24:MI:SS'), 'Aged', 'Peanutbutter', 'Neutered Male');
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
VALUES ('A353259', 'Dog', TO_DATE('2016-02-01 10:44:00', 'YYYY-MM-DD HH24:MI:SS'), 'Normal', 'Bj', 'Neutered Male');


-- 테스트 데이터 확인
Select * FROM ANIMAL_INS;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT
    ANIMAL_ID,
    NAME
    FROM ANIMAL_INS 
    ORDER BY ANIMAL_ID;

-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE ANIMAL_INS;              