-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 1)
-- 문제 : 어린 동물 찾기
-- 핵심 내용 : 1. INTAKE_CONDITION 이 'Aged'가 아닌 동물 조회
--            2. ANIMAL_ID 기준 오름차순 정렬
-- 해결방안 : ANIMAL_INS 테이블에서 INTAKE_CONDITION != 'Aged' 조건으로 필터링하고
--            ORDER BY ANIMAL_ID ASC 로 정렬하여 ID·이름 출력
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
VALUES ('A365172', 'Dog', TO_DATE('2014-08-26 12:53:00', 'YYYY-MM-DD HH24:MI:SS'), 'Normal', 'Diablo', 'Neutered Male');
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
VALUES ('A367012', 'Dog', TO_DATE('2015-09-16 09:06:00', 'YYYY-MM-DD HH24:MI:SS'), 'Sick', 'Miller', 'Neutered Male');
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
VALUES ('A365302', 'Dog', TO_DATE('2017-01-08 16:34:00', 'YYYY-MM-DD HH24:MI:SS'), 'Aged', 'Minnie', 'Spayed Female');
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
VALUES ('A381217', 'Dog', TO_DATE('2017-07-08 09:41:00', 'YYYY-MM-DD HH24:MI:SS'), 'Sick', 'Cherokee', 'Neutered Male');

-- 테스트 데이터 확인
Select * FROM ANIMAL_INS;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT
    ANIMAL_ID,
    NAME
    FROM ANIMAL_INS 
    WHERE INTAKE_CONDITION != 'Aged'
    ORDER BY ANIMAL_ID;

-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE ANIMAL_INS;              