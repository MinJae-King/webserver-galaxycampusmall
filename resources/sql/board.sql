DROP TABLE IF EXISTS board;

CREATE TABLE board (
  num INT NOT NULL AUTO_INCREMENT,
  id VARCHAR(20) NOT NULL,             -- 작성자 아이디
  name VARCHAR(50) NOT NULL,           -- 작성자 이름
  subject VARCHAR(200) NOT NULL,       -- 제목
  content TEXT NOT NULL,               -- 내용
  regist_day DATETIME DEFAULT NOW(),   -- 작성일
  hit INT DEFAULT 0,                   -- 조회수
  PRIMARY KEY (num)
) DEFAULT CHARSET=utf8;

select * from board