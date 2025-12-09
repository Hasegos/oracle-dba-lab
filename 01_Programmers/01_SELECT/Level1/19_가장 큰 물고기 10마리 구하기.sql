-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 1)
-- 문제 : 가장 큰 물고기 10마리 구하기
-- 핵심 내용 : 1. FISH_INFO 테이블에서 ID, LENGTH 컬럼 조회
--            2. LENGTH 기준 내림차순 정렬
--            3. LENGTH가 같은 경우 ID 오름차순 정렬
--            4. 오라클 환경이므로 LIMIT 사용 불가 → FETCH FIRST 10 ROWS ONLY 사용
-- 해결방안 : FISH_INFO 테이블에서 ID와 LENGTH를 조회한 뒤
--            ORDER BY LENGTH DESC, ID ASC 조건으로 정렬하여
--            가장 길이가 큰 물고기부터 우선 정렬
--            FETCH FIRST 10 ROWS ONLY 구문으로 상위 10건만 추출
-- ----------------------------------------------------------------------

-- ----------------------------------------------------------------------
-- 1. 테이블 및 컬럼 정의 (CREATE TABLE)
-- ----------------------------------------------------------------------
CREATE TABLE FISH_INFO (
    ID	INTEGER NOT NULL,
    FISH_TYPE	INTEGER NOT NULL,
    LENGTH	FLOAT,
    TIME	DATE NOT NULL
);

-- ----------------------------------------------------------------------
-- 2. 테스트 데이터 삽입 (INSERT)
-- ----------------------------------------------------------------------
INSERT INTO FISH_INFO (ID, FISH_TYPE, LENGTH, TIME) VALUES (0, 0, 30, TO_DATE('2021/12/04', 'YYYY/MM/DD'));
INSERT INTO FISH_INFO (ID, FISH_TYPE, LENGTH, TIME) VALUES (1, 0, 50, TO_DATE('2020/03/07', 'YYYY/MM/DD'));
INSERT INTO FISH_INFO (ID, FISH_TYPE, LENGTH, TIME) VALUES (2, 0, 40, TO_DATE('2020/03/07', 'YYYY/MM/DD'));
INSERT INTO FISH_INFO (ID, FISH_TYPE, LENGTH, TIME) VALUES (3, 1, 20, TO_DATE('2022/03/09', 'YYYY/MM/DD'));
INSERT INTO FISH_INFO (ID, FISH_TYPE, LENGTH, TIME) VALUES (4, 1, NULL, TO_DATE('2022/04/08', 'YYYY/MM/DD'));
INSERT INTO FISH_INFO (ID, FISH_TYPE, LENGTH, TIME) VALUES (5, 2, 13, TO_DATE('2021/04/28', 'YYYY/MM/DD'));
INSERT INTO FISH_INFO (ID, FISH_TYPE, LENGTH, TIME) VALUES (6, 3, 60, TO_DATE('2021/07/27', 'YYYY/MM/DD'));
INSERT INTO FISH_INFO (ID, FISH_TYPE, LENGTH, TIME) VALUES (7, 0, 55, TO_DATE('2021/01/18', 'YYYY/MM/DD'));
INSERT INTO FISH_INFO (ID, FISH_TYPE, LENGTH, TIME) VALUES (8, 2, 73, TO_DATE('2020/01/28', 'YYYY/MM/DD'));
INSERT INTO FISH_INFO (ID, FISH_TYPE, LENGTH, TIME) VALUES (9, 3, 73, TO_DATE('2021/04/08', 'YYYY/MM/DD'));
INSERT INTO FISH_INFO (ID, FISH_TYPE, LENGTH, TIME) VALUES (10, 2, 22, TO_DATE('2020/06/28', 'YYYY/MM/DD'));
INSERT INTO FISH_INFO (ID, FISH_TYPE, LENGTH, TIME) VALUES (11, 2, 17, TO_DATE('2022/12/23', 'YYYY/MM/DD'));

-- 테스트 데이터 확인
Select * FROM FISH_INFO;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT 
    ID as ID,
    LENGTH as LENGTH
    FROM FISH_INFO 
    ORDER BY LENGTH DESC, ID ASC
    FETCH FIRST 10 ROWS ONLY;

-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE FISH_INFO;              