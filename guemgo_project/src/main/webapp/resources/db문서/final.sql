
/* Drop Tables */

DROP TABLE answer CASCADE CONSTRAINTS;
DROP TABLE cate_s CASCADE CONSTRAINTS;
DROP TABLE requestlist CASCADE CONSTRAINTS;
DROP TABLE sche_detail CASCADE CONSTRAINTS;
DROP TABLE schedule CASCADE CONSTRAINTS;
DROP TABLE require CASCADE CONSTRAINTS;
DROP TABLE cate_m CASCADE CONSTRAINTS;
DROP TABLE cate_l CASCADE CONSTRAINTS;
DROP TABLE chatroom CASCADE CONSTRAINTS;
DROP TABLE chat CASCADE CONSTRAINTS;
DROP TABLE event CASCADE CONSTRAINTS;
DROP TABLE example CASCADE CONSTRAINTS;
DROP TABLE favorate CASCADE CONSTRAINTS;
DROP TABLE free_board CASCADE CONSTRAINTS;
DROP TABLE gosu_career CASCADE CONSTRAINTS;
DROP TABLE gosu_image CASCADE CONSTRAINTS;
DROP TABLE gosu_area CASCADE CONSTRAINTS;
DROP TABLE lecture CASCADE CONSTRAINTS;
DROP TABLE gosu CASCADE CONSTRAINTS;
DROP TABLE notice_board CASCADE CONSTRAINTS;
DROP TABLE pay CASCADE CONSTRAINTS;
DROP TABLE point CASCADE CONSTRAINTS;
DROP TABLE qna_board CASCADE CONSTRAINTS;
DROP TABLE question CASCADE CONSTRAINTS;
DROP TABLE review_board CASCADE CONSTRAINTS;
DROP TABLE users CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE answer
(
	ans_num number(7,0) NOT NULL,
	matchNum number(7,0) NOT NULL,
	ques_num number(5,0) NOT NULL,
	answer varchar2(20),
	PRIMARY KEY (ans_num)
);


CREATE TABLE cate_l
(
	l_num number(3,0) NOT NULL,
	-- 명칭(소)테이블에서 명칭을가져와서 뿌려주고 받는다
	-- 
	l_name varchar2(10),
	PRIMARY KEY (l_num)
);

CREATE TABLE cate_m
(
	m_num number(3,0) NOT NULL,
	-- 명칭(소)테이블에서 명칭을가져와서 뿌려주고 받는다
	-- 
	m_name varchar2(10),
	l_num number(3,0) NOT NULL,
	PRIMARY KEY (m_num)
);

CREATE TABLE example1
(
	m_num number(3,0) NOT NULL,
	example varchar2(50),
	ex_num number(5,0) NOT NULL,
	PRIMARY KEY (ex_num)
);

CREATE TABLE cate_s
(
	s_num number(3,0) NOT NULL,
	s_name varchar2(10),
	m_num number(3,0) NOT NULL,
	PRIMARY KEY (s_num)
);


CREATE TABLE chat
(
	chatNum number(5,0) NOT NULL,
	email varchar2(20) NOT NULL,
	other varchar2(20),
	PRIMARY KEY (chatNum)
);


CREATE TABLE chatroom
(
	msg_num number(7,0) NOT NULL,
	chatNum number(5,0) NOT NULL,
	msg varchar2(30),
	time date,
	sender varchar2(15),
	PRIMARY KEY (msg_num)
);


CREATE TABLE event
(
	stamp number(2,0),
	pointdate varchar2(20),
	email varchar2(20) NOT NULL
);


CREATE TABLE example
(
	example varchar2(50),
	ex_num number(5,0) NOT NULL,
	ques_num number(5,0) NOT NULL,
	PRIMARY KEY (ex_num)
);


-- 회원가입시 입력받아 메인페이지에서 추천할때 사용할 테이블
CREATE TABLE favorate
(
	fa_num number(4,0) NOT NULL,
	email varchar2(20) NOT NULL,
	favorate varchar2(20),
	PRIMARY KEY (fa_num)
);


CREATE TABLE free_board
(
	num number(5,0) NOT NULL,
	title varchar2(20),
	content varchar2(50),
	regdate date,
	email varchar2(20) NOT NULL,
	grp number(3,0),
	lev number(3,0),
	step number(3,0),
	hit number(3,0),
	flag number(2,0) NOT NULL,
	PRIMARY KEY (num)
);


-- 고수 프로필 작성시 사용
CREATE TABLE gosu
(
	go_num number(5,0) NOT NULL,
	email varchar2(20) NOT NULL,
	intro varchar2(100),
	grade varchar2(10),
	employ number(3,0),
	PRIMARY KEY (go_num)
);


-- 이용자의 요청서와 비교
CREATE TABLE gosu_area
(
	-- 명칭(소)테이블에서 명칭을가져와서 뿌려주고 받는다
	-- 
	area varchar2(10),
	lectureNum number(7,0) NOT NULL
);


CREATE TABLE gosu_career
(
	license varchar2(100),
	go_num number(5,0) NOT NULL,
	career varchar2(100)
);


CREATE TABLE gosu_image
(
	image varchar2(100),
	go_num number(5,0) NOT NULL
);


-- 이용자의 요청서와 매칭할 때 사용
CREATE TABLE lecture
(
	lectureNum number(7,0) NOT NULL,
	lectureName varchar2(100), -- 강의명
	region1 varchar2(100), -- 비교할 지역
	region2 varchar2(100),	-- 정보로 남길 상세지역
	gender varchar2(10),
	day varchar2(50),
	time varchar2(50),
	go_num number(5,0) NOT NULL,
	PRIMARY KEY (lectureNum)
);


CREATE TABLE notice_board
(
	num number(5,0) NOT NULL,
	title varchar2(20),
	content varchar2(50),
	regdate date,
	email varchar2(20) NOT NULL,
	PRIMARY KEY (num)
);


CREATE TABLE pay
(
	email varchar2(20) NOT NULL,
	payoption varchar2(20),
	paydate date,
	paymoney number(4,0)
);


CREATE TABLE point
(
	poi_num number(5,0) NOT NULL,
	email varchar2(20) NOT NULL,
	charge varchar2(20),
	used varchar2(20),
	pointdate date,
	point number(4,0),
	PRIMARY KEY (poi_num)
);


CREATE TABLE qna_board
(
	num number(5,0) NOT NULL,
	title varchar2(20),
	content varchar2(50),
	regdate date,
	email varchar2(20) NOT NULL,
	grp number(3,0),
	lev number(3,0),
	step number(3,0),
	flag number(2,0) NOT NULL,
	PRIMARY KEY (num)
);


CREATE TABLE question
(
	ques_num number(5,0) NOT NULL,
	ques varchar2(20),
	PRIMARY KEY (ques_num)
);


CREATE TABLE requestlist
(
	requestlistNum number(5,0) NOT NULL,
	matchNum number(7,0) NOT NULL,
	email varchar2(20) NOT NULL,
	pointdate date,
	PRIMARY KEY (requestlistNum)
);


CREATE TABLE require
(
	matchNum number(7,0) NOT NULL,
	email varchar2(20) NOT NULL,
	m_num number(7,0) NOT NULL,
	begin number(2,0),
	PRIMARY KEY (matchNum)
);


CREATE TABLE review_board
(
	num number(5,0) NOT NULL,
	email varchar2(20) NOT NULL,
	title varchar2(20),
	content varchar2(50),
	regdate date,
	grp number(3,0),
	lev number(3,0),
	step number(3,0),
	flag number(2,0) NOT NULL,
	star number(2,0),
	other varchar2(20),
	PRIMARY KEY (num)
);


CREATE TABLE schedule
(
	scheduleNum number(5,0) NOT NULL,
	email varchar2(20) NOT NULL,
	other varchar2(20),
	lectureNum number(7,0) NOT NULL,
	matchNum number(7,0) NOT NULL,
	PRIMARY KEY (scheduleNum)
);


CREATE TABLE sche_detail
(
	schedetailNum number(7,0) NOT NULL,
	scheduleNum number(5,0) NOT NULL,
	memo varchar2(20),
	sdate varchar2(20),
	edate varchar2(20),
	attendance number(2,0),
	PRIMARY KEY (schedetailNum)
);


CREATE TABLE users
(
	email varchar2(20) NOT NULL,
	flag number(2,0) NOT NULL,
	pwd varchar2(20),
	name varchar2(15),
	m_num number(5,0),
	grade varchar2(10),
	image varchar2(100),
	point number(5,0),
	regdate date,
	PRIMARY KEY (email)
);



/* Create Foreign Keys */

ALTER TABLE cate_m
	ADD FOREIGN KEY (l_num)
	REFERENCES cate_l (l_num)
;


ALTER TABLE cate_s
	ADD FOREIGN KEY (m_num)
	REFERENCES cate_m (m_num)
;


ALTER TABLE require
	ADD FOREIGN KEY (m_num)
	REFERENCES cate_m (m_num)
;


ALTER TABLE chatroom
	ADD FOREIGN KEY (chatNum)
	REFERENCES chat (chatNum)
;


ALTER TABLE gosu_career
	ADD FOREIGN KEY (go_num)
	REFERENCES gosu (go_num)
;


ALTER TABLE gosu_image
	ADD FOREIGN KEY (go_num)
	REFERENCES gosu (go_num)
;


ALTER TABLE lecture
	ADD FOREIGN KEY (go_num)
	REFERENCES gosu (go_num)
;


ALTER TABLE gosu_area
	ADD FOREIGN KEY (lectureNum)
	REFERENCES lecture (lectureNum)
;


ALTER TABLE schedule
	ADD FOREIGN KEY (lectureNum)
	REFERENCES lecture (lectureNum)
;


ALTER TABLE answer
	ADD FOREIGN KEY (ques_num)
	REFERENCES question (ques_num)
;


ALTER TABLE example
	ADD FOREIGN KEY (ques_num)
	REFERENCES question (ques_num)
;

ALTER TABLE example1
	ADD FOREIGN KEY (m_num)
	REFERENCES cate_m (m_num)
;


ALTER TABLE answer
	ADD FOREIGN KEY (matchNum)
	REFERENCES require (matchNum)
;


ALTER TABLE requestlist
	ADD FOREIGN KEY (matchNum)
	REFERENCES require (matchNum)
;


ALTER TABLE schedule
	ADD FOREIGN KEY (matchNum)
	REFERENCES require (matchNum)
;


ALTER TABLE sche_detail
	ADD FOREIGN KEY (scheduleNum)
	REFERENCES schedule (scheduleNum)
;


ALTER TABLE chat
	ADD FOREIGN KEY (email)
	REFERENCES users (email)
;


ALTER TABLE event
	ADD FOREIGN KEY (email)
	REFERENCES users (email)
;


ALTER TABLE favorate
	ADD FOREIGN KEY (email)
	REFERENCES users (email)
;


ALTER TABLE free_board
	ADD FOREIGN KEY (email)
	REFERENCES users (email)
;


ALTER TABLE gosu
	ADD FOREIGN KEY (email)
	REFERENCES users (email)
;


ALTER TABLE notice_board
	ADD FOREIGN KEY (email)
	REFERENCES users (email)
;


ALTER TABLE pay
	ADD FOREIGN KEY (email)
	REFERENCES users (email)
;


ALTER TABLE point
	ADD FOREIGN KEY (email)
	REFERENCES users (email)
;


ALTER TABLE qna_board
	ADD FOREIGN KEY (email)
	REFERENCES users (email)
;


ALTER TABLE require
	ADD FOREIGN KEY (email)
	REFERENCES users (email)
;


ALTER TABLE review_board
	ADD FOREIGN KEY (email)
	REFERENCES users (email)
;


ALTER TABLE schedule
	ADD FOREIGN KEY (email)
	REFERENCES user (email)
;



/* Comments */

COMMENT ON COLUMN cate_l.area IS '명칭(소)테이블에서 명칭을가져와서 뿌려주고 받는다
';
COMMENT ON COLUMN cate_m.area IS '명칭(소)테이블에서 명칭을가져와서 뿌려주고 받는다
';
COMMENT ON TABLE favorate IS '회원가입시 입력받아 메인페이지에서 추천할때 사용할 테이블';
COMMENT ON TABLE gosu IS '고수 프로필 작성시 사용';
COMMENT ON TABLE gosu_area IS '이용자의 요청서와 비교';
COMMENT ON COLUMN gosu_area.area IS '명칭(소)테이블에서 명칭을가져와서 뿌려주고 받는다
';
COMMENT ON TABLE lecture IS '이용자의 요청서와 매칭할 때 사용';



