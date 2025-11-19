-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 1)
-- 문제 : 조건에 부합하는 중고거래 댓글 조회하기
-- 핵심 내용 : 1. BOARD_ID가 일치하는 댓글만 조회하고 22-11-01 이전에 작성된 게시글만 대상
--            2. 댓글 생성일 오름차순, 제목 오름차순으로 정렬하여 출력
-- 해결방안 : USED_GOODS_BOARD와 USED_GOODS_REPLY를 BOARD_ID로 조인하고
--            A.CREATED_DATE < '2022-11-01' 조건을 적용한 뒤 ORDER BY 기준대로 정렬
-- ----------------------------------------------------------------------

-- ----------------------------------------------------------------------
-- 1. 테이블 및 컬럼 정의 (CREATE TABLE)
-- ----------------------------------------------------------------------
CREATE TABLE USED_GOODS_BOARD(
    BOARD_ID	VARCHAR(5)	NOT NULL,
    WRITER_ID	VARCHAR(50)	NOT NULL,
    TITLE	VARCHAR(100)	NOT NULL,
    CONTENTS	VARCHAR(1000)	NOT NULL,
    PRICE	NUMBER	NOT NULL,
    CREATED_DATE	DATE	NOT NULL,
    STATUS	VARCHAR(10)	NOT NULL,
    VIEWS	NUMBER	NOT NULL
);

CREATE TABLE USED_GOODS_REPLY(
    REPLY_ID	VARCHAR(10)NOT NULL,
    BOARD_ID	VARCHAR(5)	NOT NULL,
    WRITER_ID	VARCHAR(50)	NOT NULL,
    CONTENTS	VARCHAR(1000),
    CREATED_DATE	DATE	NOT NULL
);

-- 📌 아래 CREATE/INSERT 구문은 프로그래머스 문제에서 제공된 원본 데이터 형식을 그대로 사용
-- ----------------------------------------------------------------------
-- 2. 테스트 데이터 삽입 (INSERT)
-- ----------------------------------------------------------------------
INSERT INTO USED_GOODS_BOARD VALUES ('B0001', 'kwag98', '반려견 배변패드 팝니다', '정말 저렴히 판매합니다. 전부 미개봉 새상품입니다.', 12000, '2022-10-01',	'DONE',	250);
INSERT INTO USED_GOODS_BOARD VALUES ('B0002', 'lee871201', '국내산 볶음참깨', '직접 농사지은 참깨입니다.', 3000, '2022-10-02',	'DONE',	121);
INSERT INTO USED_GOODS_BOARD VALUES ('B0003', 'goung12', '배드민턴 라켓', '사놓고 방치만 해서 팝니다.', 9000, '2022-10-02',	'SALE',	212);
INSERT INTO USED_GOODS_BOARD VALUES ('B0004', 'keel1990', '디올 귀걸이', '신세계강남점에서 구입. 정품 아닐시 백퍼센트 환불', 130000, '2022-10-02',	'SALE',	199);
INSERT INTO USED_GOODS_BOARD VALUES ('B0005', 'haphli01', '스팸클래식 팔아요', '유통기한 2025년까지에요', 10000, '2022-10-02',	'SALE',	121);

INSERT INTO USED_GOODS_REPLY VALUES ('R000000001', 'B0001', 's2s2123', '구매하겠습니다. 쪽지 드립니다.',  '2022-10-02');
INSERT INTO USED_GOODS_REPLY VALUES ('R000000002', 'B0002', 'hoho1112', '쪽지 주세요.',  '2022-10-03');
INSERT INTO USED_GOODS_REPLY VALUES ('R000000003', 'B0006', 'hwahwa2', '삽니다. 연락주세요.', '2022-10-03');
INSERT INTO USED_GOODS_REPLY VALUES ('R000000004', 'B0007', 'hong02', '예약중', '2022-10-06');
INSERT INTO USED_GOODS_REPLY VALUES ('R000000005', 'B0009', 'hanju23', '구매완료', '2022-10-07');		

-- 테스트 데이터 확인
SELECT * FROM USED_GOODS_BOARD;
SELECT * FROM USED_GOODS_REPLY;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT A.TITLE,
       A.BOARD_ID,
       B.REPLY_ID,
       B.WRITER_ID,
       B.CONTENTS,
       TO_CHAR(B.CREATED_DATE,'YYYY-MM-DD') as CREATED_DATE    
    FROM USED_GOODS_BOARD A
    JOIN USED_GOODS_REPLY B ON A.BOARD_ID = B.BOARD_ID
    WHERE A.CREATED_DATE < DATE '2022-11-01'
    ORDER BY B.CREATED_DATE ASC,
            A.TITLE ASC;
            
-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE USED_GOODS_BOARD;
DROP TABLE USED_GOODS_REPLY;