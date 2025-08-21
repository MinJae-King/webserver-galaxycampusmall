CREATE TABLE MEMBER (
    id VARCHAR(50) NOT NULL,         -- 회원 아이디
    password VARCHAR(50) NOT NULL,   -- 비밀번호
    name VARCHAR(50) NOT NULL,       -- 이름
    gender VARCHAR(10),               -- 성별
    birth VARCHAR(50),               -- 생일
    mail VARCHAR(50),                -- 메일
    phone VARCHAR(20),               -- 전화번호
    address VARCHAR(90),             -- 주소
    PRIMARY KEY (id)                 -- 회원 아이디를 고유 키로 설정
) DEFAULT CHARSET=utf8;

SHOW TABLES;

SELECT * FROM member;
