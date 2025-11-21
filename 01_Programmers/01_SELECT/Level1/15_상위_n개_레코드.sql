-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 1)
-- 문제 : 상위 n개 레코드
-- 핵심 내용 : 1. 보호 시작일(DATETIME)이 가장 빠른 동물 1마리 조회
--            2. 오라클 기준이므로 LIMIT 사용 불가 → FETCH FIRST ROWS ONLY 사용
-- 해결방안 : ANIMAL_INS 테이블을 DATETIME 기준 오름차순 정렬한 뒤
--            FETCH FIRST ROWS ONLY 로 상위 1행만 추출하여 동물 이름 출력
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
VALUES ('A399552', 'Dog', TO_DATE('2013-10-14 15:38:00', 'YYYY-MM-DD HH24:MI:SS'), 'Normal', 'Jack', 'Neutered Male');
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
VALUES ('A379998', 'Dog', TO_DATE('2013-10-23 11:42:00', 'YYYY-MM-DD HH24:MI:SS'), 'Normal', 'Disciple', 'Intact Male');
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
VALUES ('A370852', 'Dog', TO_DATE('2013-11-03 15:04:00', 'YYYY-MM-DD HH24:MI:SS'), 'Normal', 'Katie', 'Spayed Female');
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
VALUES ('A403564', 'Dog', TO_DATE('2013-11-18 17:03:00', 'YYYY-MM-DD HH24:MI:SS'), 'Normal', 'Anna', 'Spayed Female');

-- 테스트 데이터 확인
Select * FROM ANIMAL_INS;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT
    NAME
    FROM ANIMAL_INS
    ORDER BY DATETIME
    FETCH FIRST ROWS ONLY;

-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE ANIMAL_INS;              