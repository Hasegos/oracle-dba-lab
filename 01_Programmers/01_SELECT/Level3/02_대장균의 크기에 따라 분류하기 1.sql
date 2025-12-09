-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 3)
-- 문제 : 대장균의 크기에 따라 분류하기 1
-- 핵심 내용 : 1. ECOLI_DATA 테이블에서 ID, SIZE_OF_COLONY 조회
--            2. 개체 수(SIZE_OF_COLONY)에 따라 LOW / MEDIUM / HIGH 등급 분류
--               - 100 이하        → LOW
--               - 100 초과 1000 이하 → MEDIUM
--               - 1000 초과       → HIGH
--            3. ID 기준 오름차순 정렬
-- 해결방안 : CASE WHEN 구문을 사용하여 SIZE_OF_COLONY 값의 범위에 따라
--            문자열 등급(LOW, MEDIUM, HIGH)으로 변환
--            SIZE 는 기존 컬럼이나 예약어 충돌 가능성이 있어 SIZE_GRADE 로 별칭 지정
--            ORDER BY ID ASC 로 정렬하여 결과 출력
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
VALUES (1, NULL, 17, TO_DATE('2019/01/01', 'YYYY/MM/DD'), 5);
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE)
VALUES (2, NULL, 150, TO_DATE('2019/01/01', 'YYYY/MM/DD'), 3);
INSERT INTO ECOLI_DATA (ID, PARENT_ID, SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE)
VALUES (3, 1, 4000, TO_DATE('2020/01/01', 'YYYY/MM/DD'), 4);

-- 테스트 데이터 확인
Select * FROM ECOLI_DATA;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT
   ID,
   CASE 
        WHEN SIZE_OF_COLONY <= 100 THEN 'LOW'
        WHEN SIZE_OF_COLONY <= 1000 THEN 'MEDIUM'
        ELSE 'HIGH'
    END AS SIZE_GRADE -- SIZE 별칭이 존재함으로 임시 변경
   FROM ECOLI_DATA 
   ORDER BY ID;

-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE ECOLI_DATA;             