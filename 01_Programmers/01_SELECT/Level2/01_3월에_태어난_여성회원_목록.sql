-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 2)
-- 문제 : 3월에 태어난 여성 회원 목록 출력하기
-- 핵심 내용 : 1. DATE_OF_BIRTH의 월이 03인 회원만 조회
--             2. 성별이 여성(GENDER = 'W')이고 전화번호(TLNO)가 존재하는 사용자만 검색
--             3. MEMBER_ID 오름차순 정렬
-- 해결방안 : MEMBER_PROFILE 테이블에서 월 조건과 성별 조건, 전화번호 NULL 여부를 필터링하고
--            DATE_OF_BIRTH는 TO_CHAR로 'YYYY-MM-DD' 포맷 변환 후 출력
--            ORDER BY MEMBER_ID ASC 로 정렬하여 회원 ID·이름·성별·생년월일 출력
-- ----------------------------------------------------------------------

-- ----------------------------------------------------------------------
-- 1. 테이블 및 컬럼 정의 (CREATE TABLE)
-- ----------------------------------------------------------------------
CREATE TABLE MEMBER_PROFILE (
    MEMBER_ID	VARCHAR(100) NOT NULL,
    MEMBER_NAME	VARCHAR(50)	 NOT NULL,
    TLNO	VARCHAR(50),
    GENDER	VARCHAR(1),
    DATE_OF_BIRTH	DATE
);

-- ----------------------------------------------------------------------
-- 2. 테스트 데이터 삽입 (INSERT)
-- ----------------------------------------------------------------------
INSERT INTO MEMBER_PROFILE (MEMBER_ID, MEMBER_NAME, TLNO, GENDER, DATE_OF_BIRTH) 
VALUES ('jiho92@naver.com', '이지호', '01076432111', 'W', TO_DATE('1992-02-12', 'YYYY-MM-DD'));
INSERT INTO MEMBER_PROFILE (MEMBER_ID, MEMBER_NAME, TLNO, GENDER, DATE_OF_BIRTH)
VALUES ('jiyoon22@hotmail.com', '김지윤', '01032324117', 'W', TO_DATE('1992-02-22', 'YYYY-MM-DD'));
INSERT INTO MEMBER_PROFILE (MEMBER_ID, MEMBER_NAME, TLNO, GENDER, DATE_OF_BIRTH)
VALUES ('jihoon93@hanmail.net', '김지훈', '01023258688', 'M', TO_DATE('1993-02-23', 'YYYY-MM-DD'));
INSERT INTO MEMBER_PROFILE (MEMBER_ID, MEMBER_NAME, TLNO, GENDER, DATE_OF_BIRTH)
VALUES ('seoyeons@naver.com', '박서연', '01076482209', 'W', TO_DATE('1993-03-16', 'YYYY-MM-DD'));
INSERT INTO MEMBER_PROFILE (MEMBER_ID, MEMBER_NAME, TLNO, GENDER, DATE_OF_BIRTH)
VALUES ('yoonsy94@gmail.com', '윤서연', NULL, 'W', TO_DATE('1994-03-19', 'YYYY-MM-DD'));

-- 테스트 데이터 확인
Select * FROM MEMBER_PROFILE;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT
    MEMBER_ID,
    MEMBER_NAME,
    GENDER,
    TO_CHAR(DATE_OF_BIRTH, 'YYYY-MM-DD') as DATE_OF_BIRTH
    FROM MEMBER_PROFILE 
    WHERE TO_CHAR(DATE_OF_BIRTH, 'MM') = '03'
        AND TLNO IS NOT NULL
        AND gender = 'W'
    ORDER BY MEMBER_ID ASC;

-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE MEMBER_PROFILE;              