-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 2)
-- 문제 : 특정 물고기를 잡은 총 수 구하기
-- 핵심 내용 : 1. FISH_NAME_INFO 테이블에서 FISH_NAME 이 'BASS', 'SNAPPER' 인 FISH_TYPE 추출
--            2. 서브쿼리 결과를 FISH_INFO 의 FISH_TYPE 과 IN 조건으로 비교
--            3. COUNT(*) 로 해당 물고기 수 집계
-- 해결방안 : 먼저 내부 서브쿼리에서 이름이 'BASS', 'SNAPPER' 인 어종의 FISH_TYPE 을 조회하고
--            외부 쿼리에서는 해당 FISH_TYPE 을 가진 데이터만 FISH_INFO 에서 필터링
--            이후 COUNT(*) 집계 함수를 사용해 해당 조건을 만족하는 물고기 수를 FISH_COUNT 로 출력
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

CREATE TABLE FISH_NAME_INFO (
    FISH_TYPE	INTEGER	NOT NULL,
    FISH_NAME	VARCHAR(50)	NOT NULL
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

INSERT INTO FISH_NAME_INFO (FISH_TYPE, FISH_NAME) VALUES (0, 'BASS');
INSERT INTO FISH_NAME_INFO (FISH_TYPE, FISH_NAME) VALUES (1, 'SNAPPER');
INSERT INTO FISH_NAME_INFO (FISH_TYPE, FISH_NAME) VALUES (2, 'ANCHOVY');

-- 테스트 데이터 확인
Select * FROM FISH_INFO;
Select * FROM FISH_NAME_INFO;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT 
   count(*) as FISH_COUNT
   FROM FISH_INFO 
   WHERE FISH_TYPE IN (
        SELECT FISH_TYPE 
        FROM FISH_NAME_INFO 
        WHERE FISH_NAME IN ('BASS', 'SNAPPER')
    );

-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE FISH_INFO;  
DROP TABLE FISH_NAME_INFO;            