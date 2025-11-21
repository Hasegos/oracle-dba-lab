-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 1)
-- 핵심 내용 : 1. JOINED 컬럼에서 연도(YYYY)가 2021인 사용자 필터링
--            2. AGE가 20 이상 29 이하인 사용자 조건 적용
--            3. COUNT(USER_ID)로 인원 수 집계
-- 해결방안 : USER_INFO 테이블에서 연도 조건 + 나이 범위 조건으로 필터링한 뒤
--            COUNT 함수를 사용해 해당 연도·연령대 가입자 수를 계산
--            오라클 환경이므로 날짜 비교 시 TO_CHAR(JOINED,'YYYY') 사용 가능
-- ----------------------------------------------------------------------

-- ----------------------------------------------------------------------
-- 1. 테이블 및 컬럼 정의 (CREATE TABLE)
-- ----------------------------------------------------------------------
CREATE TABLE USER_INFO   (
    USER_ID	INTEGER	NOT NULL,
    GENDER	NUMBER(1) NULL CHECK (GENDER IN (0,1)),	   
    AGE	INTEGER,
    JOINED DATE NOT NULL
);

-- ----------------------------------------------------------------------
-- 2. 테스트 데이터 삽입 (INSERT)
-- ----------------------------------------------------------------------
INSERT INTO USER_INFO (USER_ID, GENDER, AGE, JOINED) VALUES (1, 1, 26, TO_DATE('2021-10-05', 'YYYY-MM-DD'));
INSERT INTO USER_INFO (USER_ID, GENDER, AGE, JOINED) VALUES (2, 0, NULL, TO_DATE('2021-11-25', 'YYYY-MM-DD'));
INSERT INTO USER_INFO (USER_ID, GENDER, AGE, JOINED) VALUES (3, 1, 22, TO_DATE('2021-11-30', 'YYYY-MM-DD'));
INSERT INTO USER_INFO (USER_ID, GENDER, AGE, JOINED) VALUES (4, 0, 31, TO_DATE('2021-12-03', 'YYYY-MM-DD'));
INSERT INTO USER_INFO (USER_ID, GENDER, AGE, JOINED) VALUES (5, 0, 28, TO_DATE('2021-12-16', 'YYYY-MM-DD'));
INSERT INTO USER_INFO (USER_ID, GENDER, AGE, JOINED) VALUES (6, 1, 24, TO_DATE('2022-01-03', 'YYYY-MM-DD'));
INSERT INTO USER_INFO (USER_ID, GENDER, AGE, JOINED) VALUES (7, 1, NULL, TO_DATE('2022-01-09', 'YYYY-MM-DD'));

-- 테스트 데이터 확인
Select * FROM USER_INFO;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT
    COUNT(USER_ID) as USERS
    FROM USER_INFO 
    WHERE TO_CHAR(JOINED, 'YYYY') = '2021'
        AND AGE >= 20 AND AGE <= 29;

-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE USER_INFO;              