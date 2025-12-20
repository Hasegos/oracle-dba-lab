-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 1)
-- 문제 : 특정 형질을 가지는 대장균 찾기
-- 핵심 내용 : 1. GENOTYPE 컬럼은 비트마스크 기반 개체의 형질 정보
--            2. 2번 비트는 없어야함 -> BITAND(GENOTYPE, 2) = 0
--            3. 1번 비트 또는 3번 비트는 반드시 포함
--              -> BITAND(GENOTYPE, 1) = 1 OR BITAND(GENOTYPE, 4) = 4 
--            4. 조건에 만족하는 행의 개수 count
-- 해결방안 : BITAND 함수를 이용하여 GENOTYPE 의 각 비트 포함 여부를 판별
--           2번 비트가 켜져 있지 않은 데이터만 우선 필터링하고 
--           동시에 1번 또는 3번 비트가 켜져 있는 경우만 OR 조건으로 허용 
--           해당 형질이 포함되어있는 대장균 개체의 수를 COUNT로 출력 
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
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE) VALUES (1, NULL, 10, TO_DATE('2019/01/01', 'YYYY/MM/DD'), 8);
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE) VALUES (2, NULL, 2, TO_DATE('2019/01/01', 'YYYY/MM/DD'), 15);
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE) VALUES (3, 2, 100, TO_DATE('2020/01/01', 'YYYY/MM/DD'), 1);
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE) VALUES (4, 2, 16, TO_DATE('2020/01/01', 'YYYY/MM/DD'), 13);

-- 테스트 데이터 확인
Select * FROM ECOLI_DATA;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT 
    COUNT(*) as COUNT
    FROM ECOLI_DATA
    WHERE BITAND(GENOTYPE, 2) = 0
    AND  (
        BITAND(GENOTYPE, 1) = 1 
        OR 
        BITAND(GENOTYPE, 4) = 4
    );

-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE ECOLI_DATA;              