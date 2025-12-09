-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 3)
-- 문제 : 대장균들의 자식의 수 구하기
-- 핵심 내용 : 1. ECOLI_DATA 테이블의 ID 와 PARENT_ID 를 이용한 자기 자신과의 SELF JOIN
--            2. 부모(p) 기준으로 자식(c) 개체 수 집계
--            3. 자식이 없는 경우 0으로 출력 (NVL 사용)
--            4. ID 기준 오름차순 정렬
-- 해결방안 : ECOLI_DATA 테이블을 부모(p)와 자식(c) 구조로 LEFT JOIN 하여
--            p.ID = c.PARENT_ID 관계를 통해 자식 개체를 연결
--            COUNT(c.ID) 로 자식 수를 집계하고
--            자식이 없는 경우 NULL 이 되므로 NVL(COUNT(c.ID), 0) 으로 0 처리
--            GROUP BY p.ID 로 부모 기준 집계 후
--            ORDER BY p.ID ASC 로 정렬하여 출력
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
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE)
VALUES (1, NULL, 10, TO_DATE('2019/01/01', 'YYYY/MM/DD'), 5);
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE)
VALUES (2, NULL, 2, TO_DATE('2019/01/01', 'YYYY/MM/DD'), 3);
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE)
VALUES (3, 1, 100, TO_DATE('2020/01/01', 'YYYY/MM/DD'), 4);
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE)
VALUES (4, 2, 17, TO_DATE('2020/01/01', 'YYYY/MM/DD'), 4);
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE)
VALUES (5, 2, 10, TO_DATE('2020/01/01', 'YYYY/MM/DD'), 6);
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE)
VALUES (6, 4, 101, TO_DATE('2021/01/01', 'YYYY/MM/DD'), 22);

-- 테스트 데이터 확인
Select * FROM ECOLI_DATA;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT 
    p.ID,
    NVL(COUNT(c.ID), 0) AS CHILD_COUNT
    FROM ECOLI_DATA p
    LEFT JOIN ECOLI_DATA c
        ON p.ID = c.PARENT_ID
    GROUP BY p.ID
    ORDER BY p.ID;

-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE ECOLI_DATA;             