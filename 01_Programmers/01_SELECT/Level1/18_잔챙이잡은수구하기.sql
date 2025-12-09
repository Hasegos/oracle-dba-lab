-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 1)
-- 문제 : 잔챙이 잡은 수 구하기
-- 핵심 내용 : 1. FISH_INFO 테이블에서 LENGTH 값이 NULL 인 물고기만 필터링
--            2. COUNT(*) 로 해당 데이터 수 집계
-- 해결방안 : WHERE LENGTH IS NULL 조건을 사용하여
--            길이 정보가 입력되지 않은 물고기만 선별한 후
--            COUNT(*) 집계 함수를 통해 해당 물고기 수를 FISH_COUNT 로 출력
--            (NULL 비교는 = 연산자 사용 불가 → 반드시 IS NULL 사용)
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
INSERT INTO FISH_INFO  (ID, FISH_TYPE, LENGTH, TIME) VALUES (0, 0, 13.37, TO_DATE('2021/12/04', 'YYYY/MM/DD'));
INSERT INTO FISH_INFO  (ID, FISH_TYPE, LENGTH, TIME) VALUES (1, 0, 50, TO_DATE('2020/03/07', 'YYYY/MM/DD'));
INSERT INTO FISH_INFO  (ID, FISH_TYPE, LENGTH, TIME) VALUES (2, 0, 40, TO_DATE('2020/03/07', 'YYYY/MM/DD'));
INSERT INTO FISH_INFO  (ID, FISH_TYPE, LENGTH, TIME) VALUES (3, 1, 43.33, TO_DATE('2022/03/09', 'YYYY/MM/DD'));
INSERT INTO FISH_INFO  (ID, FISH_TYPE, LENGTH, TIME) VALUES (4, 1, NULL, TO_DATE('2022/04/08', 'YYYY/MM/DD'));
INSERT INTO FISH_INFO  (ID, FISH_TYPE, LENGTH, TIME) VALUES (5, 2, NULL, TO_DATE('2020/04/28', 'YYYY/MM/DD'));

-- 테스트 데이터 확인
Select * FROM FISH_INFO;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT 
    count(*) as FISH_COUNT
    FROM FISH_INFO 
    WHERE LENGTH IS NULL;

-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE FISH_INFO;              