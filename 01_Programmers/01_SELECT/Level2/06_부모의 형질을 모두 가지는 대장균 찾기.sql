-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 2)
-- 문제 : 부모의 형질을 모두 가지는 대장균 찾기
-- 핵심 내용 : 1. ECOLI_DATA 테이블을 자기 자신과 조인(Self JOIN)
--            2. Child.PARENT_ID = Parent.ID 로 부모, 자식 관계 연결
--            3. BITAND 연산을 통해 자식 GENOTYPE 이 부모 GENOTYPE 을 모두 포함하는지 확인
--              -> BITAND(Child.GENOTYPE, Parent.GENOTYPE) = Parent.GENOTYPE
--            4. 자식 ID 기준으로 오름차순 정렬
-- 해결방안 : 부모 개체의 GENOTYPE 비트가 자식 GENOTYPE 에 모두 포함되어 있는 경우만
--            BITAND 결과가 Parent.GENOTYPE 과 동일해짐
--            해당 조건을 WHERE 절에서 필터링하여
--            부모의 모든 대장균형질을 가진 자식 개체만 선별
--            ORDER BY Child.ID ASC 로 자식 ID 기준 정렬하여 결과 출력
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
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE) VALUES (1, NULL, 10, TO_DATE('2019/01/01', 'YYYY/MM/DD'), 1);
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE) VALUES (2, 1, 2, TO_DATE('2019/01/01', 'YYYY/MM/DD'), 1);
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE) VALUES (3, 1, 100, TO_DATE('2020/01/01', 'YYYY/MM/DD'), 3);
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE) VALUES (4, 2, 16, TO_DATE('2020/01/01', 'YYYY/MM/DD'), 2);
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE) VALUES (5, 4, 17, TO_DATE('2020/01/01', 'YYYY/MM/DD'), 8);
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE) VALUES (6, 3, 101, TO_DATE('2021/01/01', 'YYYY/MM/DD'), 5);
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE) VALUES (7, 2, 101, TO_DATE('2022/01/01', 'YYYY/MM/DD'), 5);
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE) VALUES (8, 6, 1, TO_DATE('2022/01/01', 'YYYY/MM/DD'), 13);

-- 테스트 데이터 확인
Select * FROM ECOLI_DATA;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT 
    Child.ID,
    Child.GENOTYPE,
    Parent.GENOTYPE AS PARENT_GENOTYPE
    FROM ECOLI_DATA Child
        JOIN ECOLI_DATA Parent
        ON Child.PARENT_ID = Parent.ID
    WHERE BITAND(Child.GENOTYPE, Parent.GENOTYPE) = Parent.GENOTYPE        
    ORDER BY Child.ID ASC;

-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE ECOLI_DATA;              