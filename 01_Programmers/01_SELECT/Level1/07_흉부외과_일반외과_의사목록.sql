-- ----------------------------------------------------------------------
-- 🎯 문제 정보
-- ----------------------------------------------------------------------
-- 프로그래머스 SQL (Level 1)
-- 문제 : 흉부외과 또는 일반 외과 의사 목록 출력하기
-- 핵심 내용 : MCDP_CD가 'CS' 또는 'GS'인 필터링 및 고용일 내림차순,(고용일이 같은 경우) 이름 오름차순 정렬

-- ----------------------------------------------------------------------
-- 1. 테이블 및 컬럼 정의 (CREATE TABLE)
-- ----------------------------------------------------------------------
CREATE TABLE DOCTOR(
    DR_NAME VARCHAR(20) NOT NULL,
    DR_ID VARCHAR(10) NOT NULL,
    LCNS_NO VARCHAR(30) NOT NULL,
    HIRE_YMD DATE NOT NULL,
    MCDP_CD VARCHAR(6),
    TLNO VARCHAR(50)
);

-- ----------------------------------------------------------------------
-- 2. 테스트 데이터 삽입 (INSERT)
-- ----------------------------------------------------------------------
INSERT INTO DOCTOR(DR_NAME, DR_ID, LCNS_NO,HIRE_YMD, MCDP_CD, TLNO) VALUES ('루피', 'DR20090029', 'LC00010001' , '2009-03-01', 'CS', '01085482011'); 
INSERT INTO DOCTOR(DR_NAME, DR_ID, LCNS_NO,HIRE_YMD, MCDP_CD, TLNO) VALUES ('패티', 'DR20090001', 'LC00010901' , '2009-07-01', 'CS', '01085220122'); 
INSERT INTO DOCTOR(DR_NAME, DR_ID, LCNS_NO,HIRE_YMD, MCDP_CD, TLNO) VALUES ('뽀로로', 'DR20170123', 'LC00091201' , '2017-03-01', 'GS', '01034969210'); 
INSERT INTO DOCTOR(DR_NAME, DR_ID, LCNS_NO,HIRE_YMD, MCDP_CD, TLNO) VALUES ('티커', 'DR20100011', 'LC00011201' , '2010-03-01', 'NP', '01034229818'); 
INSERT INTO DOCTOR(DR_NAME, DR_ID, LCNS_NO,HIRE_YMD, MCDP_CD, TLNO) VALUES ('품바', 'DR20090231', 'LC00011302' , '2015-11-01', 'OS', '01049840278'); 
INSERT INTO DOCTOR(DR_NAME, DR_ID, LCNS_NO,HIRE_YMD, MCDP_CD, TLNO) VALUES ('티몬', 'DR20090112', 'LC00011162' , '2010-03-01', 'FM', '01094622190'); 
INSERT INTO DOCTOR(DR_NAME, DR_ID, LCNS_NO,HIRE_YMD, MCDP_CD, TLNO) VALUES ('니모', 'DR20200012', 'LC00911162' , '2020-03-01', 'CS', '01089483921'); 
INSERT INTO DOCTOR(DR_NAME, DR_ID, LCNS_NO,HIRE_YMD, MCDP_CD, TLNO) VALUES ('오로라', 'DR20100031', 'LC00010327' , '2010-11-01', 'OS', '01098428957'); 
INSERT INTO DOCTOR(DR_NAME, DR_ID, LCNS_NO,HIRE_YMD, MCDP_CD, TLNO) VALUES ('자스민', 'DR20100032', 'LC00010192' , '2010-03-01', 'GS', '01023981922'); 
INSERT INTO DOCTOR(DR_NAME, DR_ID, LCNS_NO,HIRE_YMD, MCDP_CD, TLNO) VALUES ('벨', 'DR20100039', 'LC00010562' , '2010-07-01', 'GS', '01058390758'); 

-- 테스트 데이터 확인
Select * FROM DOCTOR;

-- ----------------------------------------------------------------------
-- 3. [답안] 문제 해결 SQL (SELECT)
-- ----------------------------------------------------------------------
SELECT DR_NAME,DR_ID,MCDP_CD,TO_CHAR(HIRE_YMD, 'YYYY-MM-DD') AS HIRE_YMD
    FROM DOCTOR 
    WHERE MCDP_CD IN ('CS', 'GS')
    ORDER BY HIRE_YMD DESC,
             DR_NAME ASC;

-- ----------------------------------------------------------------------
-- 4. 사용 후 처리 (DROP TABLE)
-- ----------------------------------------------------------------------
DROP TABLE DOCTOR;              