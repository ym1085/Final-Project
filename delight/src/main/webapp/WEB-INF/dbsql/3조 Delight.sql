/*
--1. D드라이브 delight 폴더 생성(테이블스페이스 폴더)
--2. 오라클 관리자계정 접속 (cmd -> sqlplus / as sysdba) 
--1. 테이블스페이스 생성
 create tablespace tbs_delight
 datafile 'D:\delight\tb_delight.dbf' size 500M
 autoextend on next 50M;
 
--2. 디비 유저 , 생성
 create user delight
 identified by delight123
 default tablespace tbs_delight;

--권한부여
grant connect, resource to delight;

--락해제
alter user delight account unlock;*/


ALTER TABLE tbl_mileage
	DROP
		CONSTRAINT FK_tbl_user_TO_tbl_mileage
		CASCADE;

ALTER TABLE tbl_mileage
	DROP
		CONSTRAINT FK_tbl_mileagebec_TO_tbl_mileage
		CASCADE;

ALTER TABLE tbl_review
	DROP
		CONSTRAINT FK_tbl_user_TO_tbl_review
		CASCADE;

ALTER TABLE tbl_review
	DROP
		CONSTRAINT FK_tbl_reservation_TO_tbl_review
		CASCADE;

ALTER TABLE tbl_ann
	DROP
		CONSTRAINT FK_tbl_user_TO_tbl_ann
		CASCADE;

ALTER TABLE tbl_reservation
	DROP
		CONSTRAINT FK_tbl_user_TO_tbl_reservation
		CASCADE;

ALTER TABLE tbl_reservation
	DROP
		CONSTRAINT FK_tbl_ticket_TO_tbl_reservation
		CASCADE;

ALTER TABLE tbl_discount
	DROP
		CONSTRAINT FK_tbl_ticket_TO_tbl_discount
		CASCADE;

ALTER TABLE tbl_promote
	DROP
		CONSTRAINT FK_tbl_user_TO_tbl_promote
		CASCADE;

ALTER TABLE tbl_payment
	DROP
		CONSTRAINT FK_tbl_reservation_TO_tbl_payment
		CASCADE;

ALTER TABLE tbl_inquery
	DROP
		CONSTRAINT FK_tbl_user_TO_tbl_inquery
		CASCADE;

ALTER TABLE tbl_faq
	DROP
		CONSTRAINT FK_tbl_user_TO_tbl_faq
		CASCADE;

ALTER TABLE tbl_inqAnw
	DROP
		CONSTRAINT FK_tbl_user_TO_tbl_inqAnw
		CASCADE;

ALTER TABLE tbl_inqAnw
	DROP
		CONSTRAINT FK_tbl_inquery_TO_tbl_inqAnw
		CASCADE;

ALTER TABLE tbl_like
	DROP
		CONSTRAINT FK_tbl_user_TO_tbl_like
		CASCADE;

ALTER TABLE tbl_user
	DROP
		CONSTRAINT FK_out_reason_TO_tbl_user
		CASCADE;

ALTER TABLE tbl_user
	DROP
		CONSTRAINT FK_tbl_grade_TO_tbl_user
		CASCADE;

ALTER TABLE tbl_premium
	DROP
		CONSTRAINT FK_tbl_user_TO_tbl_premium
		CASCADE;

ALTER TABLE tbl_refund
	DROP
		CONSTRAINT FK_tbl_payment_TO_tbl_refund
		CASCADE;

ALTER TABLE tbl_refund
	DROP
		CONSTRAINT FK_tbl_refundbec_TO_tbl_refund
		CASCADE;

ALTER TABLE tbl_mileage
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tbl_mileagebec
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tbl_review
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tbl_ann
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tbl_reservation
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tbl_readcount
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tbl_discount
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tbl_promote
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tbl_payment
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tbl_inquery
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tbl_faq
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tbl_inqAnw
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tbl_like
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tbl_grade
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tbl_user
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tbl_premium
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE visitors
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE out_reason
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tbl_sido
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tbl_gugun
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tbl_ticket
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tbl_recent
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tbl_refund
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tbl_refundbec
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

/* 마일리지 변화 */
DROP TABLE tbl_mileage 
	CASCADE CONSTRAINTS;

/* 마일리지 변화 사유 내용 */
DROP TABLE tbl_mileagebec 
	CASCADE CONSTRAINTS;

/* 후기 */
DROP TABLE tbl_review 
	CASCADE CONSTRAINTS;

/* 공지사항 */
DROP TABLE tbl_ann 
	CASCADE CONSTRAINTS;

/* 예매 */
DROP TABLE tbl_reservation 
	CASCADE CONSTRAINTS;

/* 공연게시물 조회수 */
DROP TABLE tbl_readcount 
	CASCADE CONSTRAINTS;

/* 특별할인 */
DROP TABLE tbl_discount 
	CASCADE CONSTRAINTS;

/* 홍보 게시판 */
DROP TABLE tbl_promote 
	CASCADE CONSTRAINTS;

/* 결제내역 */
DROP TABLE tbl_payment 
	CASCADE CONSTRAINTS;

/* 1:1 문의 게시판 */
DROP TABLE tbl_inquery 
	CASCADE CONSTRAINTS;

/* 자주 묻는 질문 */
DROP TABLE tbl_faq 
	CASCADE CONSTRAINTS;

/* 문의 답변 */
DROP TABLE tbl_inqAnw 
	CASCADE CONSTRAINTS;

/* 좋아요 */
DROP TABLE tbl_like 
	CASCADE CONSTRAINTS;

/* 회원등급 */
DROP TABLE tbl_grade 
	CASCADE CONSTRAINTS;

/* 유저 */
DROP TABLE tbl_user 
	CASCADE CONSTRAINTS;

/* 회원권 */
DROP TABLE tbl_premium 
	CASCADE CONSTRAINTS;

/* 방문자 */
DROP TABLE visitors 
	CASCADE CONSTRAINTS;

/* 탈퇴 사유 */
DROP TABLE out_reason 
	CASCADE CONSTRAINTS;

/* 지역(시,도) 코드 */
DROP TABLE tbl_sido 
	CASCADE CONSTRAINTS;

/* 지역(구, 군) 코드 */
DROP TABLE tbl_gugun 
	CASCADE CONSTRAINTS;

/* 공연별 판매가능 수량 */
DROP TABLE tbl_ticket 
	CASCADE CONSTRAINTS;

/* 최근 본 공연 */
DROP TABLE tbl_recent 
	CASCADE CONSTRAINTS;

/* 환불 */
DROP TABLE tbl_refund 
	CASCADE CONSTRAINTS;

/* 환불 사유 */
DROP TABLE tbl_refundbec 
	CASCADE CONSTRAINTS;

/* 마일리지 변화 */
CREATE TABLE tbl_mileage (
	mileage_seq NUMBER NOT NULL, /* 마일리지 변화 시퀀스 */
	mileage_point NUMBER NOT NULL, /* 마일리지 변화 금액 */
	mileage_reg DATE DEFAULT sysdate NOT NULL, /* 마일리지 변화 날짜 */
	userid VARCHAR2(50) NOT NULL, /* 아이디 */
	mileaebec_seq NUMBER /* 마일리지 변화 사유 내용 시퀀스 */
);

ALTER TABLE tbl_mileage
	ADD
		CONSTRAINT PK_tbl_mileage
		PRIMARY KEY (
			mileage_seq
		);

/* 마일리지 변화 사유 내용 */
CREATE TABLE tbl_mileagebec (
	mileaebec_seq NUMBER NOT NULL, /* 마일리지 변화 사유 내용 시퀀스 */
	mileage_bec VARCHAR2(50) NOT NULL /* 변화 사유 */
);

ALTER TABLE tbl_mileagebec
	ADD
		CONSTRAINT PK_tbl_mileagebec
		PRIMARY KEY (
			mileaebec_seq
		);

/* 후기 */
CREATE TABLE tbl_review (
	review_seq NUMBER NOT NULL, /* 후기 시퀀스 */
	review_type VARCHAR2(1) NOT NULL, /* 후기 타입 */
	review_mt20id VARCHAR2(200) NOT NULL,/* 공연 id*/
	review_title VARCHAR2(100) NOT NULL, /* 후기 제목 */
	review_content CLOB NOT NULL, /* 후기 내용 */
	review_score NUMBER, /* 평점 */
	review_p1 CLOB, /* 후기 사진1 */
	review_p2 CLOB, /* 후기 사진2 */
	review_p3 CLOB, /* 후기 사진3 */
	review_regdate DATE DEFAULT sysdate NOT NULL, /* 후기 등록일 */
	review_mileage NUMBER NOT NULL, /* 후기 등록지급 마일리지  20 50 75 100*/
	userid VARCHAR2(50) NOT NULL, /* 아이디 */
	reservation_seq NUMBER /* 예매 시퀀스 */
);

ALTER TABLE tbl_review
	ADD
		CONSTRAINT PK_tbl_review
		PRIMARY KEY (
			review_seq
		);

/* 공지사항 */
CREATE TABLE tbl_ann (
	ann_seq NUMBER NOT NULL, /* 공지사항 시퀀스 */
	ann_type VARCHAR2(1) NOT NULL, /* 공지사항 타입 */
	ann_title VARCHAR2(100) NOT NULL, /* 공지사항 제목 */
	ann_content CLOB NOT NULL, /* 공지사항 내용 */
	ann_img VARCHAR2(300) , /* 공지 이미지 경로*/
	ann_top VARCHAR2(1) DEFAULT 'N', /* 상단 고정 여부 */
	ann_show VARCHAR2(1) DEFAULT 'N', /* 노출 여부 */
	ann_regdate DATE DEFAULT sysdate NOT NULL, /* 공지사항 등록일 */
	userid VARCHAR2(50) NOT NULL /* 아이디 */
);

ALTER TABLE tbl_ann
	ADD
		CONSTRAINT PK_tbl_ann
		PRIMARY KEY (
			ann_seq
		);

/* 예매 */
CREATE TABLE tbl_reservation (
	reservation_seq NUMBER NOT NULL, /* 예매 시퀀스 */
	mt20id VARCHAR2(20) NOT NULL, /* 공연 id */
	prfnm VARCHAR2(60), /* 공연명 */
	pay_price NUMBER, /* 공연가격 */
	perfomtype VARCHAR2(20) NOT NULL, /* 공연종류 */
	mt10id VARCHAR2(20) NOT NULL, /* 공연시설 id */
	select_date DATE NOT NULL, /* 내가 선택한 날짜 */
	select_time VARCHAR2(50) NOT NULL, /* 내가 선택한 시간 */
	booking NUMBER NOT NULL, /* 구매 장수 */
	seat_class VARCHAR2(10) NOT NULL, /* 구매한 좌석 등급 */
	pay_ticket_number VARCHAR2(30) NOT NULL, /* 예매 번호 */
	res_date DATE DEFAULT sysdate NOT NULL, /* 예매 날짜 */
	userid VARCHAR2(50) NOT NULL, /* 아이디 */
	ticket_seq NUMBER /* 수량 시퀀스 */
);

ALTER TABLE tbl_reservation
	ADD
		CONSTRAINT PK_tbl_reservation
		PRIMARY KEY (
			reservation_seq
		);

/* 공연게시물 조회수 */
CREATE TABLE tbl_readcount (
	readcount_seq NUMBER NOT NULL, /* 공연 조회수 시퀀스 */
	mt20id VARCHAR2(20) /* 공연 id */
);

ALTER TABLE tbl_readcount
	ADD
		CONSTRAINT PK_tbl_readcount
		PRIMARY KEY (
			readcount_seq
		);

/* 특별할인 */
CREATE TABLE tbl_discount (
	discount_seq NUMBER NOT NULL, /* 할인번호 */
	detail VARCHAR2(50), /* 할인설명 */
	percent NUMBER NOT NULL, /* 할인율 */
	ticket_seq NUMBER /* 수량 시퀀스 */
);

ALTER TABLE tbl_discount
	ADD
		CONSTRAINT PK_tbl_discount
		PRIMARY KEY (
			discount_seq
		);

/* 홍보 게시판 */
CREATE TABLE tbl_promote (
	promote_seq NUMBER NOT NULL, /* 홍보게시물 시퀀스 */
	promote_title VARCHAR2(200) NOT NULL, /* 홍보게시물 제목 */
	promote_content CLOB NOT NULL, /* 홍보 내용 */
	promote_p1 CLOB, /* 홍보 사진1 */
	review_regdate DATE DEFAULT sysdate NOT NULL, /* 홍보게시물 등록일 */
	mileagegive VARCHAR2(1) DEFAULT 'N' NOT NULL, /* 지급완료*/
	userid VARCHAR2(50) NOT NULL /* 아이디 */
);

ALTER TABLE tbl_promote
	ADD
		CONSTRAINT PK_tbl_promote
		PRIMARY KEY (
			promote_seq
		);

/* 결제내역 */
CREATE TABLE tbl_payment (
	pay_seq NUMBER NOT NULL, /* 결제번호 */
	pay_price NUMBER NOT NULL, /* 결제금액 */
	usedmileage NUMBER, /*사용한 마일리지*/
	reg_date DATE DEFAULT sysdate NOT NULL, /* 결제일자 */
	pay_condition VARCHAR2(1) DEFAULT 'Y' NOT NULL, /* 결제상태 C는 환불*/
	reservation_seq NUMBER NOT NULL /* 예매 시퀀스 */
);

ALTER TABLE tbl_payment
	ADD
		CONSTRAINT PK_tbl_payment
		PRIMARY KEY (
			pay_seq
		);

/* 1:1 문의 게시판 */
CREATE TABLE tbl_inquery (
	inquery_seq NUMBER NOT NULL, /* 문의 시퀀스 */
	inquery_content VARCHAR2(200) NOT NULL, /* 문의내용 */
	reg_date DATE DEFAULT sysdate, /* 문의날짜 */
	inquery_title VARCHAR2(50), /* 문의제목 */
	inquery_condition VARCHAR2(15) DEFAULT 'N', /* 답변상태 */
	userid VARCHAR2(50), /* 아이디 */
	username VARCHAR2(30), /* 이름 */
	email VARCHAR2(30), /* 이메일 */
	hp VARCHAR2(30) /* 전화번호 */
);

ALTER TABLE tbl_inquery
	ADD
		CONSTRAINT PK_tbl_inquery
		PRIMARY KEY (
			inquery_seq
		);

/* 자주 묻는 질문 */
CREATE TABLE tbl_faq (
	faq_seq NUMBER NOT NULL, /* 자주묻는질문 시퀀스 */
	faq_title VARCHAR2(300) NOT NULL, /* 자주묻는질문 제목 */
	faq_content CLOB NOT NULL, /* 자주묻는질문 내용 */
	faq_type VARCHAR2(50) NOT NULL, /* 자주묻는질문 타입 */
	faq_regdate DATE DEFAULT sysdate NOT NULL, /* 등록일 */
	userid VARCHAR2(50) /* 아이디 */
);

ALTER TABLE tbl_faq
	ADD
		CONSTRAINT PK_tbl_faq
		PRIMARY KEY (
			faq_seq
		);

/* 문의 답변 */
CREATE TABLE tbl_inqAnw (
	inqanw_seq NUMBER NOT NULL, /* 문의답변 시퀀스 */
	inqanw_content VARCHAR2(200) NOT NULL, /* 답변내용 */
	reg_date DATE DEFAULT sysdate NOT NULL, /* 답변날짜 */
	inquery_seq NUMBER NOT NULL, /* 문의 시퀀스 */
	userid VARCHAR2(50) NOT NULL /* 아이디 */
);

ALTER TABLE tbl_inqAnw
	ADD
		CONSTRAINT PK_tbl_inqAnw
		PRIMARY KEY (
			inqanw_seq
		);

/* 좋아요 */
CREATE TABLE tbl_like (
	likeCount_seq NUMBER NOT NULL, /* 좋아요 증가 시퀀스  */
	mt20id VARCHAR2(20) NOT NULL, /* 공연 id */
	prfnm VARCHAR2(60), /* 공연명 */
	genre VARCHAR2(30), /* 장르 */
	userid VARCHAR2(50) NOT NULL /* 아이디 */
);

ALTER TABLE tbl_like
	ADD
		CONSTRAINT PK_tbl_like
		PRIMARY KEY (
			likeCount_seq
		);

/* 회원등급 */
CREATE TABLE tbl_grade (
	grade_seq NUMBER NOT NULL, /* 등급 번호 */
	grade_name VARCHAR2(10) NOT NULL, /* 회원별 등급이름 */
	grade_standard NUMBER NOT NULL, /* 회원별 등급기준 */
	grade_benefit NUMBER NOT NULL /* 등급별 할인 혜택율 */
);

ALTER TABLE tbl_grade
	ADD
		CONSTRAINT PK_tbl_grade
		PRIMARY KEY (
			grade_seq,
			grade_name
		);

/* 유저 */
CREATE TABLE tbl_user (
	userid VARCHAR2(50) NOT NULL, /* 아이디 */
	username VARCHAR2(30) NOT NULL, /* 이름 */
	password VARCHAR2(500byte) NOT NULL, /* 비밀번호 */
	birth VARCHAR2(12) NOT NULL, /* 생년월일 */
	email1 VARCHAR2(30) NOT NULL, /* 이메일1 */
	email2 VARCHAR(20) NOT NULL, /* 이메일2 */
	hp1 VARCHAR2(3) NOT NULL, /* 전화번호1 */
	hp2 VARCHAR2(4) NOT NULL, /* 전화번호2 */
	hp3 VARCHAR2(4) NOT NULL, /* 전화번호3 */
	zipcode VARCHAR2(10), /* 우편번호 */
	address VARCHAR2(200), /* 주소 */
	address_detail VARCHAR2(200), /* 상세주소 */
	gender VARCHAR2(5) NOT NULL, /* 성별 */
	mail_agreement VARCHAR2(5) NOT NULL, /* 메일수신동의여부 */
	mail_authen VARCHAR2(3) DEFAULT 'N' NOT NULL, /* 메일인증여부 */
	mileagePoint NUMBER DEFAULT 0, /* 적립된 마일리지 */
	logout_date DATE, /* 로그아웃 일자 */
	join_date DATE DEFAULT sysdate, /* 가입일 */
	out_date DATE, /* 탈퇴일 */
	salt VARCHAR2(100 char), /* 암호화 */
	out_reason_no NUMBER, /* 탈퇴사유 번호 */
	grade_seq NUMBER DEFAULT 1, /* 등급 번호 */
	grade_name VARCHAR2(10) DEFAULT 'b' /* 회원별 등급이름 */
);

ALTER TABLE tbl_user
	ADD
		CONSTRAINT PK_tbl_user
		PRIMARY KEY (
			userid
		);

/* 회원권 */
CREATE TABLE tbl_premium (
	premium_seq NUMBER NOT NULL, /* 회원권 번호 */
	name VARCHAR2(100) NOT NULL, /* 회원권 이름 */
	detail VARCHAR2(200) NOT NULL, /* 상세혜택 */
	start_date TIMESTAMP NOT NULL, /* 혜택 시작일 */
	end_date TIMESTAMP NOT NULL, /* 혜택 종료일 */
	userid VARCHAR2(50) NOT NULL /* 아이디 */
);

ALTER TABLE tbl_premium
	ADD
		CONSTRAINT PK_tbl_premium
		PRIMARY KEY (
			premium_seq
		);

/* 방문자 */
CREATE TABLE visitors (
	visitor_today DATE NOT NULL, /* 날짜 */
	visitor_count NUMBER DEFAULT 0 /* 방문자 수 */
);

ALTER TABLE visitors
	ADD
		CONSTRAINT PK_visitors
		PRIMARY KEY (
			visitor_today
		);

/* 탈퇴 사유 */
CREATE TABLE out_reason (
	out_reason_seq NUMBER NOT NULL, /* 탈퇴사유 번호 */
	out_reason VARCHAR2(100) NOT NULL /* 탈퇴사유 */
);

ALTER TABLE out_reason
	ADD
		CONSTRAINT PK_out_reason
		PRIMARY KEY (
			out_reason_seq
		);

/* 지역(시,도) 코드 */
CREATE TABLE tbl_sido (
	signgucode NUMBER NOT NULL, /* 코드 */
	sido VARCHAR2(30) NOT NULL /* 시,도 명 */
);

ALTER TABLE tbl_sido
	ADD
		CONSTRAINT PK_tbl_sido
		PRIMARY KEY (
			signgucode
		);

/* 지역(구, 군) 코드 */
CREATE TABLE tbl_gugun (
	signgucodesub NUMBER NOT NULL, /* 코드 */
	gugun VARCHAR2(60) NOT NULL /* 구,군 명 */
);

ALTER TABLE tbl_gugun
	ADD
		CONSTRAINT PK_tbl_gugun
		PRIMARY KEY (
			signgucodesub
		);

/* 공연별 판매가능 수량 */
CREATE TABLE tbl_ticket (
	ticket_seq NUMBER NOT NULL, /* 수량 시퀀스 */
	mt20id VARCHAR2(20) NOT NULL, /* 공연 id */
	prfnm VARCHAR2(100) NOT NULL, /* 공연명 */
	prfdate VARCHAR2(15) NOT NULL, /* 공연 날짜 */
	prfhour VARCHAR2(15) NOT NULL, /* 공연 시간 */
	sellticket NUMBER NOT NULL, /* 판매하는 표 수량 */
	sellclass VARCHAR2(30) NOT NULL, /* 판매하는 표 좌석등급 */
	netprice NUMBER NOT NULL, /* 정가 */
	selled NUMBER DEFAULT 0, /* 판매된장수 */
	regdate DATE DEFAULT sysdate NOT NULL /* 설정 날짜 */
);

ALTER TABLE tbl_ticket
	ADD
		CONSTRAINT PK_tbl_ticket
		PRIMARY KEY (
			ticket_seq
		);

/* 최근 본 공연 */
CREATE TABLE tbl_recent (
	recent_seq NUMBER NOT NULL, /* 최근 본 공연 시퀀스 */
	iporid VARCHAR2(20) NOT NULL, /* ip또는 id */
	mt20id VARCHAR2(20) NOT NULL, /* 공연 id */
	prfnm VARCHAR2(60), /* 공연명 */
	showdate DATE DEFAULT sysdate NOT NULL /* 본 날짜 */
);

ALTER TABLE tbl_recent
	ADD
		CONSTRAINT PK_tbl_recent
		PRIMARY KEY (
			recent_seq
		);

/* 환불 */
CREATE TABLE tbl_refund (
   refund_seq NUMBER NOT NULL, /* 환불 시퀀스 */
   compflag VARCHAR2(2) DEFAULT 'N' NOT NULL,/* 환불 상태 */
   refund_price NUMBER, /* 환불되는 금액 */ 
   pay_seq NUMBER NOT NULL, /* 결제번호 */
   refundbec_seq NUMBER NOT NULL,/* 환불 사유 시퀀스 */
   refund_cancle date default sysdate,  /*환불 신청날짜*/
   refund_cancle_ok date /*환불 완료날짜*/
);

ALTER TABLE tbl_refund
	ADD
		CONSTRAINT PK_tbl_refund
		PRIMARY KEY (
			refund_seq
		);

/* 환불 사유 */
CREATE TABLE tbl_refundbec (
	refundbec_seq NUMBER NOT NULL, /* 환불 사유 시퀀스 */
	detail VARCHAR2(300) NOT NULL /* 사유 */
);

ALTER TABLE tbl_refundbec
	ADD
		CONSTRAINT PK_tbl_refundbec
		PRIMARY KEY (
			refundbec_seq
		);

ALTER TABLE tbl_mileage
	ADD
		CONSTRAINT FK_tbl_user_TO_tbl_mileage
		FOREIGN KEY (
			userid
		)
		REFERENCES tbl_user (
			userid
		);

ALTER TABLE tbl_mileage
	ADD
		CONSTRAINT FK_tbl_mileagebec_TO_tbl_mileage
		FOREIGN KEY (
			mileaebec_seq
		)
		REFERENCES tbl_mileagebec (
			mileaebec_seq
		);

ALTER TABLE tbl_review
	ADD
		CONSTRAINT FK_tbl_user_TO_tbl_review
		FOREIGN KEY (
			userid
		)
		REFERENCES tbl_user (
			userid
		);

ALTER TABLE tbl_review
	ADD
		CONSTRAINT FK_tbl_reservation_TO_tbl_review
		FOREIGN KEY (
			reservation_seq
		)
		REFERENCES tbl_reservation (
			reservation_seq
		);

ALTER TABLE tbl_ann
	ADD
		CONSTRAINT FK_tbl_user_TO_tbl_ann
		FOREIGN KEY (
			userid
		)
		REFERENCES tbl_user (
			userid
		);

ALTER TABLE tbl_reservation
	ADD
		CONSTRAINT FK_tbl_user_TO_tbl_reservation
		FOREIGN KEY (
			userid
		)
		REFERENCES tbl_user (
			userid
		);

ALTER TABLE tbl_reservation
	ADD
		CONSTRAINT FK_tbl_ticket_TO_tbl_reservation
		FOREIGN KEY (
			ticket_seq
		)
		REFERENCES tbl_ticket (
			ticket_seq
		);

ALTER TABLE tbl_discount
	ADD
		CONSTRAINT FK_tbl_ticket_TO_tbl_discount
		FOREIGN KEY (
			ticket_seq
		)
		REFERENCES tbl_ticket (
			ticket_seq
		);

ALTER TABLE tbl_promote
	ADD
		CONSTRAINT FK_tbl_user_TO_tbl_promote
		FOREIGN KEY (
			userid
		)
		REFERENCES tbl_user (
			userid
		);

ALTER TABLE tbl_payment
	ADD
		CONSTRAINT FK_tbl_reservation_TO_tbl_payment
		FOREIGN KEY (
			reservation_seq
		)
		REFERENCES tbl_reservation (
			reservation_seq
		);

ALTER TABLE tbl_inquery
	ADD
		CONSTRAINT FK_tbl_user_TO_tbl_inquery
		FOREIGN KEY (
			userid
		)
		REFERENCES tbl_user (
			userid
		);

ALTER TABLE tbl_faq
	ADD
		CONSTRAINT FK_tbl_user_TO_tbl_faq
		FOREIGN KEY (
			userid
		)
		REFERENCES tbl_user (
			userid
		);

ALTER TABLE tbl_inqAnw
	ADD
		CONSTRAINT FK_tbl_user_TO_tbl_inqAnw
		FOREIGN KEY (
			userid
		)
		REFERENCES tbl_user (
			userid
		);

ALTER TABLE tbl_inqAnw
	ADD
		CONSTRAINT FK_tbl_inquery_TO_tbl_inqAnw
		FOREIGN KEY (
			inquery_seq
		)
		REFERENCES tbl_inquery (
			inquery_seq
		);

ALTER TABLE tbl_like
	ADD
		CONSTRAINT FK_tbl_user_TO_tbl_like
		FOREIGN KEY (
			userid
		)
		REFERENCES tbl_user (
			userid
		);

ALTER TABLE tbl_user
	ADD
		CONSTRAINT FK_out_reason_TO_tbl_user
		FOREIGN KEY (
			out_reason_no
		)
		REFERENCES out_reason (
			out_reason_seq
		);

ALTER TABLE tbl_user
	ADD
		CONSTRAINT FK_tbl_grade_TO_tbl_user
		FOREIGN KEY (
			grade_seq,
			grade_name
		)
		REFERENCES tbl_grade (
			grade_seq,
			grade_name
		);

ALTER TABLE tbl_premium
	ADD
		CONSTRAINT FK_tbl_user_TO_tbl_premium
		FOREIGN KEY (
			userid
		)
		REFERENCES tbl_user (
			userid
		);

ALTER TABLE tbl_refund
	ADD
		CONSTRAINT FK_tbl_payment_TO_tbl_refund
		FOREIGN KEY (
			pay_seq
		)
		REFERENCES tbl_payment (
			pay_seq
		);

ALTER TABLE tbl_refund
	ADD
		CONSTRAINT FK_tbl_refundbec_TO_tbl_refund
		FOREIGN KEY (
			refundbec_seq
		)
		REFERENCES tbl_refundbec (
			refundbec_seq
		);

--마일리지 변화
drop sequence mileage_seq;
create sequence mileage_seq
start with 1
increment by 1
nocache;

--마일리지 변화 사유
drop sequence mileaebec_seq;
create sequence mileaebec_seq
start with 1
increment by 1
nocache;


--후기
drop sequence review_seq;
create sequence review_seq
start with 1
increment by 1
nocache;

--공지사항
drop sequence ann_seq;
create sequence ann_seq
start with 1
increment by 1
nocache;

--예매
drop sequence reservation_seq;
create sequence reservation_seq
start with 1
increment by 1
nocache;


--조회수
drop sequence readcount_seq;
create sequence readcount_seq
start with 1
increment by 1
nocache;

--특별할인
drop sequence discount_seq;
create sequence discount_seq
start with 1
increment by 1
nocache;

--홍보 게시판
drop sequence promote_seq;
create sequence promote_seq
start with 1
increment by 1
nocache;

--결제내역
drop sequence pay_seq;
create sequence pay_seq
start with 1
increment by 1
nocache;

--1:1 문의
drop sequence inquery_seq;
create sequence inquery_seq
start with 1
increment by 1
nocache;

--자주묻는질문
drop sequence faq_seq;
create sequence faq_seq
start with 1
increment by 1
nocache;

--문의 답변
drop sequence inqanw_seq;
create sequence inqanw_seq
start with 1
increment by 1
nocache;

--좋아요
drop sequence likeCount_seq;
create sequence likeCount_seq
start with 1
increment by 1
nocache;

--회원등급
drop sequence grade_seq;
create sequence grade_seq
start with 1
increment by 1
nocache;

--회원권
drop sequence premium_seq;
create sequence premium_seq
start with 1
increment by 1
nocache;

--탈퇴사유
drop sequence out_reason_seq;
create sequence out_reason_seq
start with 1
increment by 1
nocache;

--공연별 판매수량
drop sequence ticket_seq;
create sequence ticket_seq
start with 1
increment by 1
nocache;

--최근본 공연
drop sequence recent_seq;
create sequence recent_seq
start with 1
increment by 1
nocache;

--환불 신청
drop sequence refund_seq;
create sequence refund_seq
start with 1
increment by 1
nocache;

--환불 사유
drop sequence refundbec_seq;
create sequence refundbec_seq
start with 1
increment by 1
nocache;


--특별 공연 할인
drop sequence discount_seq;
create sequence discount_seq
start with 1
increment by 1
nocache;

insert into tbl_grade values(grade_seq.nextval , 'b', 0 , 0);
insert into tbl_grade values(grade_seq.nextval , 's', 500000 , 1);
insert into tbl_grade values(grade_seq.nextval , 'g', 1000000 , 2);
insert into tbl_grade values(grade_seq.nextval , 'p', 1500000 , 3);
insert into tbl_grade values(grade_seq.nextval , 'vip', 2000000 , 5);
insert into tbl_grade values(grade_seq.nextval , 'admin', 99999999999999999999 , 10);

insert into tbl_mileagebec values(mileaebec_seq.nextval , '결제후 적립');
insert into tbl_mileagebec values(mileaebec_seq.nextval , '일반후기 적립');
insert into tbl_mileagebec values(mileaebec_seq.nextval , '포토후기 적립');
insert into tbl_mileagebec values(mileaebec_seq.nextval , '홍보이벤트 적립');
insert into tbl_mileagebec values(mileaebec_seq.nextval , '결제금액 할인');
insert into tbl_mileagebec values(mileaebec_seq.nextval , '환불 차감');
insert into tbl_mileagebec values(mileaebec_seq.nextval , '환불 증가');

insert into out_reason values(out_reason_seq.nextval, '타 사이트 이용');
insert into out_reason values(out_reason_seq.nextval, '자주 이용하지 않음');
insert into out_reason values(out_reason_seq.nextval, '아이디 변경');
insert into out_reason values(out_reason_seq.nextval, '관리자 권한 강퇴');
insert into out_reason values(out_reason_seq.nextval, '휴면 계정');

insert into tbl_refundbec values(refundbec_seq.nextval, '단순 변심');
insert into tbl_refundbec values(refundbec_seq.nextval, '스케쥴 변경으로 인한 공연 관람 불가');
insert into tbl_refundbec values(refundbec_seq.nextval, '예매 실수');
insert into tbl_refundbec values(refundbec_seq.nextval, '자리 변경');
insert into tbl_refundbec values(refundbec_seq.nextval, '다른 공연 관람');

insert into tbl_user(userid,username,password,birth,email1,email2,hp1,hp2,hp3,gender,mail_agreement,grade_seq,grade_name)
values('admin','관리자','1','1989-04-01','glddld','nate.com','010','6244','9984','남','N',6,'admin');

commit;