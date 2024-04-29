create database matjjang;
use matjjang;

create table t_admin_info (
	ai_idx int auto_increment unique,	-- 일련번호
    ai_id varchar(20) primary key,		-- 아이디
    ai_pw varchar(20) not null,			-- 비밀번호
    ai_name varchar(20) not null,		-- 이름
    ai_use char(1) default 'y',			-- 사용여부
	ai_date datetime default now()		-- 등록일
);
insert into t_admin_info (ai_id,ai_pw,ai_name) values ('admin','1234','admin');

select * from t_admin_info;

create table t_member_info (
	mi_id varchar(20) primary key,		-- 회원 아이디
    mi_pw varchar(20) not null,			-- 회원 비밀번호
    mi_name varchar(20) not null,		-- 회원 이름
	mi_phone varchar(13) not null,		-- 전화번호
    mi_birth char(10) not null,			-- 생년월일
	mi_gender char(1) not null,			-- 성별
	mi_email varchar(50) not null,		-- 이메일
	mi_status char(1) default 'a',		-- 상태 
	mi_date datetime default now(),		-- 가입일
	mi_lastlogin datetime				-- 최종 로그인
);
insert into t_member_info values ('test', '1234', '이한나', '010-9182-6545', '2001-03-02', '여', 'lhn@naver.com', 'a', now(), null);
insert into t_member_info values ('test1', '1234', '홍길동', '010-1234-6578', '1998-10-20', '남', 'hgd@naver.com', 'a', now(), null);

-- 회원 주소록 테이블
create table t_member_addr (
	ma_idx int primary key auto_increment,	-- 일련번호
	mi_id varchar(20) not null,				-- 회원아이디
	ma_zip char(5) not null,				-- 우편번호
	ma_addr1 varchar(50) not null,			-- 주소1
	ma_addr2 varchar(50) not null,			-- 주소2
	ma_date datetime default now(),			-- 등록일
    constraint fk_t_member_addr_mi_id foreign key(mi_id) references t_member_info(mi_id)
);

select * from t_member_addr;
insert into t_member_addr (mi_id, ma_zip, ma_addr1, ma_addr2) values ('test', '12345', '부산시 연제구 연산동', '987-654');

-- 음식점 분류 테이블
create table t_store_ctgr (
   sc_id char(2) primary key,   	-- 분류 코드
   sc_name varchar(20) not null   	-- 분류 이름
);

drop table t_store_ctgr;
select * from t_store_ctgr;

insert into t_store_ctgr (sc_id, sc_name) values ('AA', '한식');
insert into t_store_ctgr (sc_id, sc_name) values ('BB', '양식');
insert into t_store_ctgr (sc_id, sc_name) values ('CC', '중식');
insert into t_store_ctgr (sc_id, sc_name) values ('DD', '일식');
insert into t_store_ctgr (sc_id, sc_name) values ('EE', '디저트');


-- 음식점 테이블
create table t_store_info (
	si_id char(5) primary key,			-- 맛집ID
	sc_id char(2) not null,				-- 분류 코드
	si_name varchar(50) not null,		-- 음식점명
	si_img1 varchar(50) not null,		-- 음식 이미지1
	si_img2 varchar(50) default '',		-- 음식 이미지2
	si_img3 varchar(50) default '',		-- 음식 이미지3
    si_star float not null,				-- 음식점 별점
	si_week varchar(50) not null,		-- 영업 요일
	si_open varchar(20) not null,		-- 영업 시간 오픈
	si_close varchar(20) not null,		-- 영업 시간 마감
	si_parking varchar(10) not null,	-- 주차 여부
	si_addr1 varchar(50) not null,		-- 주소
	si_addr2 varchar(50) not null,		-- 지번주소
    si_lat decimal(18,14) not null,		-- 경도
    si_lng decimal(18,14) not null,		-- 위도
    si_number varchar(13) not null,		-- 전화번호
	si_explan varchar(500),				-- 매장소개
	si_read int default 0,				-- 조회수
	si_review int default 0,			-- 후기 개수
	si_isview char(1) default 'y',		-- 게시여부
	si_date datetime default now(),     -- 등록일
	ai_idx int not null,            	-- 등록관리자
	si_last datetime default now(),		-- 최종 수정일
	si_admin int default 0,				-- 최종 수정자
   constraint fk_store_info_sc_id foreign key (sc_id) references t_store_ctgr(sc_id),
   constraint fk_store_info_ai_idx foreign key (ai_idx) references t_admin_info(ai_idx)
);

insert into t_store_info(si_id, sc_id, si_name, si_img1, si_img2, si_img3, si_star, si_week, si_open, si_close, si_parking, si_addr1, si_addr2, si_lat, si_lng, si_number, si_explan, si_read, si_review, si_isview, ai_idx, si_last, si_admin) 
values ('AA106', 'AA', 'OO음식점', 'AAbb10101.jpg', '', '', 1.5, '월~금', '9:00', '21:00', '주차/발렛', '서울특별시 강남구 도산대로101길 6', '서울특별시 강남구 청담동 129-10', 37.3595704, 127.105399, '01012345678', '안녕하세요 OO음식점 입니다.', 0, 0, 'y', 1, now(), 0);

select * from t_store_info;

-- 음식점 댓글 테이블
create table t_store_reply (
	sr_idx int primary key auto_increment,	-- 댓글번호
	si_id char(5) not null,					-- 맛집ID
	mi_id varchar(20) not null,				-- 회원아이디
	sr_ismem char(1) default 'y',			-- 회원여부
    sr_star float not null,					-- 음식점 별점				
	sr_content varchar(200) not null,		-- 내용
    sr_good int default 0,					-- 좋아요 수
    sr_img1 varchar(50) default '',			-- 음식 이미지1
	sr_img2 varchar(50) default '',			-- 음식 이미지2
	sr_img3 varchar(50) default '',			-- 음식 이미지3
	sr_isview char(1) default 'y',			-- 게시여부
	sr_date datetime default now(),			-- 작성일
	constraint fk_t_store_reply_si_id foreign key(si_id) references t_store_info(si_id),
    constraint fk_t_store_reply_mi_id foreign key(mi_id) references t_member_info(mi_id)
);

select * from t_store_reply;  	
select a.*, b.mi_id, b.mi_name from t_store_reply a join t_member_info b on a.mi_id = b.mi_id where a.sr_isview = 'y' and a.si_id = 'AA776' order by a.sr_idx desc;
use matjjang;
select * from t_store_reply where sr_idx = 4 and mi_id = 'test';

insert into t_store_reply values('1', 'AA776', 'test', 'y', '5', '댓글', 1, 'img.png', '', '', 'y', now());

-- 음식점 댓글 좋아요 테이블
create table t_store_reply_gnb (
	srg_idx int auto_increment unique,
    mi_id varchar(20),
    sr_idx int,
	srg_gnb int default 1,
    srg_date datetime default now(), 
    constraint pk_store_reply_gnb primary key (mi_id, sr_idx),
    constraint fk_store_reply_gnb_mi_id foreign key (mi_id) references t_member_info(mi_id), 
    constraint fk_store_reply_gnb_sr_idx foreign key (sr_idx) references t_store_reply(sr_idx)
);

select * from t_store_reply_gnb;	

select * from t_store_reply_gnb where sr_idx IN (4) and mi_id= 'test1';

select concat(srg_gnb, srg_idx) from t_store_reply_gnb where mi_id = 'test1' and sr_idx = 4;


insert into t_store_reply_gnb(mi_id, sr_idx, srg_gnb) values('test1', '4', '1');
delete from t_store_reply_gnb where sr_idx = 4 and mi_id = 'test1';

-- 맛집게시판 테이블
create table t_free_list (
	fl_idx int primary key auto_increment,	-- 글번호
    mi_id varchar(20) not null,            	-- 회원아이디
	fl_ismem char(1) default 'y',			-- 회원여부
	fl_writer varchar(20) not null,			-- 작성자
	fl_title varchar(100) not null,			-- 제목
	fl_content text not null,				-- 내용
	fl_reply int default 0,					-- 댓글갯수
	fl_read int default 0,					-- 조회수
    fl_good int default 0,					-- 좋아요 수
	fl_img1 varchar(50) default '',			-- 이미지1
	fl_img2 varchar(50) default '',			-- 이미지2
    fl_img3 varchar(50) default '',			-- 이미지3
	fl_isview char(1) default 'y',			-- 게시여부
	fl_date datetime default now()			-- 작성일
);

-- 맛집게시판 댓글 테이블
create table t_free_reply (
	fr_idx int primary key auto_increment,	-- 댓글번호
	fl_idx int not null,					-- 게시글번호
	mi_id varchar(20) not null,				-- 회원아이디
	fr_ismem char(1) default 'y',			-- 회원여부
	fr_content varchar(200) not null,		-- 내용
	fr_isview char(1) default 'y',			-- 게시여부
	fr_date datetime default now(),			-- 작성일
    constraint fk_t_free_reply_fl_idx foreign key (fl_idx) references t_free_list(fl_idx),
    constraint fk_t_member_info_mi_id foreign key (mi_id) references t_member_info(mi_id)
);



