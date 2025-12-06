-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 1)
-- 문제 : Python 개발자 찾기
-- 핵심 내용 : 1. DEVELOPER_INFOS 테이블에서 SKILL_1 · SKILL_2 · SKILL_3 중
--               하나라도 'Python' 이 포함된 개발자만 조회
--            2. SELECT 대상은 ID, EMAIL, FIRST_NAME, LAST_NAME
--            3. ID 기준 오름차순 정렬
-- 해결방안 : 세 기술 컬럼(SKILL_1, SKILL_2, SKILL_3)에 대해 OR 조건을 적용하여
--            Python 기술을 가진 개발자만 필터링
--            ORDER BY ID ASC 로 정렬해 개발자 정보를 출력
-- ----------------------------------------------------------------------

-- ----------------------------------------------------------------------
-- 1. 테이블 및 컬럼 정의 (CREATE TABLE)
-- ----------------------------------------------------------------------
CREATE TABLE DEVELOPER_INFOS (
    ID	VARCHAR(50)	UNIQUE	NOT NULL,
    FIRST_NAME	VARCHAR(50),
    LAST_NAME	VARCHAR(50),
    EMAIL	VARCHAR(50)	UNIQUE	NOT NULL,
    SKILL_1	VARCHAR(50),
    SKILL_2	VARCHAR(50),
    SKILL_3	VARCHAR(50)
);

-- ----------------------------------------------------------------------
-- 2. 테스트 데이터 삽입 (INSERT)
-- ----------------------------------------------------------------------
INSERT INTO DEVELOPER_INFOS (ID, FIRST_NAME, LAST_NAME, EMAIL, SKILL_1, SKILL_2, SKILL_3)
VALUES ('D165', 'Jerami', 'Edwards', 'jerami_edwards@grepp.co', 'Java', 'JavaScript', 'Python');
INSERT INTO DEVELOPER_INFOS (ID, FIRST_NAME, LAST_NAME, EMAIL, SKILL_1, SKILL_2, SKILL_3)
VALUES ('D161', 'Carsen', 'Garza', 'carsen_garza@grepp.co', 'React', NULL, NULL);
INSERT INTO DEVELOPER_INFOS (ID, FIRST_NAME, LAST_NAME, EMAIL, SKILL_1, SKILL_2, SKILL_3)
VALUES ('D164', 'Kelly', 'Grant', 'kelly_grant@grepp.co', 'C#', NULL, NULL);
INSERT INTO DEVELOPER_INFOS (ID, FIRST_NAME, LAST_NAME, EMAIL, SKILL_1, SKILL_2, SKILL_3)
VALUES ('D163', 'Luka', 'Cory', 'luka_cory@grepp.co', 'Node.js', NULL, NULL);
INSERT INTO DEVELOPER_INFOS (ID, FIRST_NAME, LAST_NAME, EMAIL, SKILL_1, SKILL_2, SKILL_3)
VALUES ('D162', 'Cade', 'Cunningham', 'cade_cunningham@grepp.co', 'Vue', 'C++', 'Python');


-- 테스트 데이터 확인
Select * FROM DEVELOPER_INFOS;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT 
    ID,
    EMAIL,
    FIRST_NAME,
    LAST_NAME
    FROM DEVELOPER_INFOS 
    WHERE SKILL_1 = 'Python ' 
        or SKILL_2 = 'Python'
        or SKILL_3 = 'Python'
    ORDER BY ID;

-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE DEVELOPER_INFOS;              