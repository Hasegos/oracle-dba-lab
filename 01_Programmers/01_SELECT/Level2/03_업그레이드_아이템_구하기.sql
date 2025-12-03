-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 2)
-- 문제 : 업그레이드 된 아이템 구하기
-- 핵심 내용 : 1. ITEM_INFO 테이블과 ITEM_TREE 테이블 조인
--            2. 부모 아이템(C)의 RARITY가 'RARE' 인 경우만 조회
--            3. 조회 대상은 자식 아이템(A)의 ITEM_ID · ITEM_NAME · RARITY
--            4. ITEM_ID 기준 내림차순 정렬
-- 해결방안 : ITEM_INFO A 와 ITEM_TREE B, 그리고 부모 정보인 ITEM_INFO C 를 조인하여
--            B.PARENT_ITEM_ID = C.ITEM_ID 관계를 통해 부모 아이템 희귀도 확인
--            WHERE C.RARITY = 'RARE' 조건으로 필터링 후
--            ORDER BY A.ITEM_ID DESC 로 자식 아이템을 정렬하여 출력
-- ----------------------------------------------------------------------

-- ----------------------------------------------------------------------
-- 1. 테이블 및 컬럼 정의 (CREATE TABLE)
-- ----------------------------------------------------------------------
CREATE TABLE ITEM_INFO (
   ITEM_ID	INTEGER	NOT NULL,
   ITEM_NAME	VARCHAR(50)	NOT NULL,
   RARITY	VARCHAR2(50)	NOT NULL,
   PRICE	INTEGER	NOT NULL
);

CREATE TABLE ITEM_TREE (
  ITEM_ID	INTEGER	NOT NULL,
  PARENT_ITEM_ID	INTEGER
);

-- ----------------------------------------------------------------------
-- 2. 테스트 데이터 삽입 (INSERT)
-- ----------------------------------------------------------------------
INSERT INTO ITEM_INFO (ITEM_ID, ITEM_NAME, RARITY, PRICE) VALUES (0, 'ITEM_A', 'RARE', 10000);
INSERT INTO ITEM_INFO (ITEM_ID, ITEM_NAME, RARITY, PRICE) VALUES (1, 'ITEM_B', 'RARE', 9000);
INSERT INTO ITEM_INFO (ITEM_ID, ITEM_NAME, RARITY, PRICE) VALUES (2, 'ITEM_C', 'LEGEND', 11000);
INSERT INTO ITEM_INFO (ITEM_ID, ITEM_NAME, RARITY, PRICE) VALUES (3, 'ITEM_D', 'RARE', 10000);
INSERT INTO ITEM_INFO (ITEM_ID, ITEM_NAME, RARITY, PRICE) VALUES (4, 'ITEM_E', 'RARE', 12000);

INSERT INTO ITEM_TREE (ITEM_ID, PARENT_ITEM_ID) VALUES (0, NULL);
INSERT INTO ITEM_TREE (ITEM_ID, PARENT_ITEM_ID) VALUES (1, 0);
INSERT INTO ITEM_TREE (ITEM_ID, PARENT_ITEM_ID) VALUES (2, 0);
INSERT INTO ITEM_TREE (ITEM_ID, PARENT_ITEM_ID) VALUES (3, 1);
INSERT INTO ITEM_TREE (ITEM_ID, PARENT_ITEM_ID) VALUES (4, 1);

-- 테스트 데이터 확인
Select * FROM ITEM_INFO;
Select * FROM ITEM_TREE;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT 
    A.ITEM_ID,
    A.ITEM_NAME,
    A.RARITY
    FROM 
        ITEM_INFO A
    JOIN 
        ITEM_TREE B
        ON A.ITEM_ID = B.ITEM_ID
    JOIN
        ITEM_INFO C
        ON B.PARENT_ITEM_ID = C.ITEM_ID
    WHERE
        C.RARITY = 'RARE'
    ORDER BY A.ITEM_ID DESC;

-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE ITEM_INFO;  
DROP TABLE ITEM_TREE;            