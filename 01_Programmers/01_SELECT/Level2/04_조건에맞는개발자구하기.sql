-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 2)
-- 문제 : 조건에 맞는 개발자 찾기
-- 핵심 내용 : 1. DEVELOPERS 와 SKILLCODES 테이블 조인
--            2. BITAND(d.SKILL_CODE, s.CODE) > 0 조건으로 기술 보유 여부 판별
--            3. 기술명이 'Python' 또는 'C#' 인 개발자만 조회
--            4. 중복 제거를 위해 DISTINCT 사용
--            5. ID 기준 오름차순 정렬
-- 해결방안 : DEVELOPERS 의 SKILL_CODE 는 비트마스크 기반 정수값이므로
--            SKILLCODES.CODE 와 BITAND 연산을 통해 기술 보유 여부를 판별
--            WHERE s.NAME IN ('Python', 'C#') 조건으로 대상 기술 필터링
--            동일 개발자가 여러 기술로 중복 조회될 수 있으므로 DISTINCT 적용
--            ORDER BY d.ID ASC 로 개발자 ID 기준 오름차순 정렬하여 출력
-- ----------------------------------------------------------------------

-- ----------------------------------------------------------------------
-- 1. 테이블 및 컬럼 정의 (CREATE TABLE)
-- ----------------------------------------------------------------------
CREATE TABLE SKILLCODES (
   NAME	VARCHAR(50)	unique	NOT NULL,
    CATEGORY	VARCHAR(50)	NOT NULL,
    CODE	INTEGER	unique	NOT NULL
);

CREATE TABLE DEVELOPERS (
    ID	VARCHAR(50)	unique NOT NULL,
    FIRST_NAME	VARCHAR(50),
    LAST_NAME	VARCHAR(50),
    EMAIL	VARCHAR(50) unique NOT NULL,
    SKILL_CODE	INTEGER	NOT NULL
);

-- ----------------------------------------------------------------------
-- 2. 테스트 데이터 삽입 (INSERT)
-- ----------------------------------------------------------------------
INSERT INTO SKILLCODES (NAME, CATEGORY, CODE) VALUES ('C++', 'Back End', 4);
INSERT INTO SKILLCODES (NAME, CATEGORY, CODE) VALUES ('JavaScript', 'Front End', 16);
INSERT INTO SKILLCODES (NAME, CATEGORY, CODE) VALUES ('Java', 'Back End', 128);
INSERT INTO SKILLCODES (NAME, CATEGORY, CODE) VALUES ('Python', 'Back End', 256);
INSERT INTO SKILLCODES (NAME, CATEGORY, CODE) VALUES ('C#', 'Back End', 1024);
INSERT INTO SKILLCODES (NAME, CATEGORY, CODE) VALUES ('React', 'Front End', 2048);
INSERT INTO SKILLCODES (NAME, CATEGORY, CODE) VALUES ('Vue', 'Front End', 8192);
INSERT INTO SKILLCODES (NAME, CATEGORY, CODE) VALUES ('Node.js', 'Back End', 16384);

INSERT INTO DEVELOPERS (ID, FIRST_NAME, LAST_NAME, EMAIL, SKILL_CODE)
VALUES ('D165', 'Jerami', 'Edwards', 'jerami_edwards@grepp.co', 400);
INSERT INTO DEVELOPERS (ID, FIRST_NAME, LAST_NAME, EMAIL, SKILL_CODE)
VALUES ('D161', 'Carsen', 'Garza', 'carsen_garza@grepp.co', 2048);
INSERT INTO DEVELOPERS (ID, FIRST_NAME, LAST_NAME, EMAIL, SKILL_CODE)
VALUES ('D164', 'Kelly', 'Grant', 'kelly_grant@grepp.co', 1024);
INSERT INTO DEVELOPERS (ID, FIRST_NAME, LAST_NAME, EMAIL, SKILL_CODE)
VALUES ('D163', 'Luka', 'Cory', 'luka_cory@grepp.co', 16384);
INSERT INTO DEVELOPERS (ID, FIRST_NAME, LAST_NAME, EMAIL, SKILL_CODE)
VALUES ('D162', 'Cade', 'Cunningham', 'cade_cunningham@grepp.co', 8452);

-- 테스트 데이터 확인
Select * FROM SKILLCODES;
Select * FROM DEVELOPERS;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT DISTINCT
    d.ID,
    d.EMAIL,
    d.FIRST_NAME,
    d.LAST_NAME
    FROM DEVELOPERS d
    JOIN SKILLCODES s
        ON BITAND(d.SKILL_CODE, s.CODE) > 0
    WHERE s.NAME IN ('Python', 'C#')
    ORDER BY d.ID ASC;

-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE SKILLCODES;  
DROP TABLE DEVELOPERS;            