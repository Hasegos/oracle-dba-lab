-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 3)
-- 문제 : 대장균의 크기에 따라 분류하기 2
-- 핵심 내용 : 1. ECOLI_DATA 테이블에서 ID, SIZE_OF_COLONY 조회
--            2. 개체 수(SIZE_OF_COLONY)에 따라 CRITICAL / HIGH  / MEDIUM / LOW  등급 분류
--               - 상위 0% ~ 25%  → CRITICAL
--               - 상위 26% ~ 50%  → HIGH
--               - 상위 51% ~ 75%  → MEDIUM
--               - 상위 76% ~ 100%  → LOW
--            3. ID 기준 오름차순 정렬
-- 해결방안 : CASE WHEN 구문을 사용하여 SIZE_OF_COLONY 값의 상위 퍼센트에 따라
--           문자열 등급(CRITICAL, HIGH, MEDIUM, LOW)으로 변환
--           상위 퍼센트 등급에 대한 별징은 COLONY_NAME 로 지정
--           ORDER BY ID ASC 로 정렬하여 결과 출력
-- ----------------------------------------------------------------------

-- ----------------------------------------------------------------------
-- 1. 테이블 및 컬럼 정의 (CREATE TABLE)
-- ----------------------------------------------------------------------
CREATE TABLE ECOLI_DATA (
    ID	INTEGER	NOT NULL,
    PARENT_ID	INTEGER,
    SIZE_OF_COLONY	INTEGER	NOT NULL,
    DIFFERENTIATION_DATE	DATE NOT NULL,
    GENOTYPE	INTEGER	NOT NULL
);

-- ----------------------------------------------------------------------
-- 2. 테스트 데이터 삽입 (INSERT)
-- ----------------------------------------------------------------------
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE) VALUES (1, NULL, 10, TO_DATE('2019/01/01', 'YYYY/MM/DD'), 5);
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE) VALUES (2, NULL, 2, TO_DATE('2019/01/01', 'YYYY/MM/DD'), 3);
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE) VALUES (3, 1, 100, TO_DATE('2020/01/01', 'YYYY/MM/DD'), 4);
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE) VALUES (4, 2, 16, TO_DATE('2020/01/01', 'YYYY/MM/DD'), 4);
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE) VALUES (5, 2, 17, TO_DATE('2020/01/01', 'YYYY/MM/DD'), 6);
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE) VALUES (6, 4, 101, TO_DATE('2021/01/01', 'YYYY/MM/DD'), 22);
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE) VALUES (7, 6, 101, TO_DATE('2022/01/01', 'YYYY/MM/DD'), 23);
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE) VALUES (8, 6, 1, TO_DATE('2022/01/01', 'YYYY/MM/DD'), 27);

-- 테스트 데이터 확인
Select * FROM ECOLI_DATA;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT 
    ID,
    CASE 
        WHEN A.PERCENT <= 25 THEN 'CRITICAL'
        WHEN A.PERCENT <= 50 THEN 'HIGH'
        WHEN A.PERCENT <= 75 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS COLONY_NAME    
    FROM (
        SELECT 
            ID,
            PERCENT_RANK() OVER (ORDER BY SIZE_OF_COLONY DESC) * 100 AS PERCENT
        FROM ECOLI_DATA 
    ) A
    ORDER BY A.ID ASC;

-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE ECOLI_DATA;             