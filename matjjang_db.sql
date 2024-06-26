drop database matjjang;
create database matjjang;
use matjjang;


-- 관리자 테이블
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

-- 회원 테이블
create table t_member_info (
	mi_id varchar(20) primary key,		-- 회원 아이디
    mi_pw varchar(20),					-- 회원 비밀번호
    mi_name varchar(20) not null,		-- 회원 이름
	mi_phone varchar(13) not null,		-- 전화번호
    mi_birth char(10) not null,			-- 생년월일
	mi_gender char(1) not null,			-- 성별
	mi_email varchar(50) not null,		-- 이메일
	mi_status char(1) default 'a',		-- 상태 
	mi_date datetime default now(),		-- 가입일
	mi_lastlogin datetime				-- 최종 로그인
);

select * from t_member_info;

select count(*) from t_member_info where mi_id = 'test' and mi_email = 'lhn@naver.com';

select mi_pw from t_member_info where mi_pw = ?;

select * from t_member_info where mi_id = 'test';

update t_member_info set mi_pw = '1234' where mi_id = 'test' and mi_email = 'lhn@naver.com';

update t_member_info set mi_status = 'a' where mi_id = 'test';

select * from t_member_info where mi_name = '이한나' and mi_email = 'lhn@naver.com';

insert into t_member_info values ('test', '1234', '이한나', '010-1111-2222', '2001-03-02', '여', 'lhn@naver.com', 'a', now(), null);
insert into t_member_info values ('test', '1234', '테스터', '010-1234-6578', '1998-10-20', '남', 'test@naver.com', 'a', now(), null);

insert into t_member_info values ('', '', '', '', '', '', '', 'a', now(), null);


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
	si_id char(5) primary key,			-- 음식점ID
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
    si_heart int default 0,				-- 좋아요 수
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

select count(*) from t_store_reply where mi_id = 'test';

update t_store_info set si_review = 1 where si_id = 'AA098';

delete from t_store_info;

update t_store_info set si_review = 0;

-- 음식점 좋아요 테이블
create table t_store_heart (
	sh_idx int primary key auto_increment,		-- 일련번호
	si_id char(5) not null,						-- 음식점ID 
	mi_id varchar(20) not null,					-- 회원 아이디
	sh_heart int default 0,						-- 좋아요 여부
	constraint fk_store_heart_si_id foreign key (si_id) references t_store_info(si_id),
    constraint fk_store_heart_mi_id foreign key (mi_id) references t_member_info(mi_id)
);

select * from t_store_heart;

delete from t_store_heart where si_id = '';

select a.*, b.si_name, b.si_img1, b.si_star, b.si_addr1, b.si_open, b.si_close from t_store_heart a join t_store_info b on a.si_id = b.si_id where mi_id = 'test'; 

insert into t_store_heart (si_id, mi_id, sh_heart) values ('BB301', 'test', 'y');

-- 음식점 즐겨찾기 테이블
create table t_store_bookmark (
	sb_idx int primary key auto_increment,		-- 일련번호
	si_id char(5) not null,						-- 음식점ID 
	mi_id varchar(20) not null,					-- 회원 아이디
	sb_bookmark int default 0,					-- 즐겨찾기 여부
	constraint fk_store_bookmark_si_id foreign key (si_id) references t_store_info(si_id),
    constraint fk_store_bookmark_mi_id foreign key (mi_id) references t_member_info(mi_id)
);

select * from t_store_bookmark;


-- 음식점 리뷰 테이블
create table t_store_reply (
	sr_idx int primary key auto_increment,	-- 리뷰번호
	si_id char(5) not null,					-- 음식점ID
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

select a.*, b.si_name from t_store_reply a join t_store_info b on a.si_id = b.si_id where mi_id = 'test';

delete from t_store_reply; 	
select a.*, b.mi_id, b.mi_name from t_store_reply a join t_member_info b on a.mi_id = b.mi_id where a.sr_isview = 'y' and a.si_id = 'AA776' order by a.sr_idx desc;
use matjjang;
select * from t_store_reply where sr_idx = 4 and mi_id = 'test';

update t_store_info set si_review = si_review - 1 where si_review > 0 and sr_idx = 19;

insert into t_store_reply values('1', 'AA776', 'test', 'y', '5', '댓글', 1, 'img.png', '', '', 'y', now());

-- 음식점 댓글 좋아요 테이블
create table t_store_reply_gnb (
	srg_idx int auto_increment unique,	-- 좋아요 번호
    mi_id varchar(20) not null,			-- 회원 아이디
    sr_idx int,							-- 댓글 번호
	srg_gnb int default 1,				-- 좋아요 여부
    srg_date datetime default now(), 	-- 날짜
    constraint pk_store_reply_gnb primary key (mi_id, sr_idx),
    constraint fk_store_reply_gnb_mi_id foreign key (mi_id) references t_member_info(mi_id), 
    constraint fk_store_reply_gnb_sr_idx foreign key (sr_idx) references t_store_reply(sr_idx)
);

select * from t_store_reply_gnb;

drop table t_store_reply_gnb;	

select * from t_store_reply_gnb where sr_idx IN (3, 6) and mi_id= 'test';

update t_store_reply set sr_good = sr_good + 1 where sr_idx = 1;

select concat(srg_gnb, srg_idx) from t_store_reply_gnb where mi_id = 'test1' and sr_idx = 4;

select a.*, b.mi_id, b.mi_name from t_store_reply a join t_member_info b on a.mi_id = b.mi_id where a.sr_isview = 'y' and a.si_id = 'AA528' order by a.sr_idx desc limit 10;

select count(*) a, count(*) b, count(*) c from t_store_bookmark a, t_store_reply b, t_store_heart c where a.mi_id = b.mi_id and b.mi_id = c.mi_id and a.mi_id = 'test'; 
select a.mi_id, a.pi_id, a.oc_date, a.oc_option, a.oc_cnt, a.oc_price, a.first_cnt, a.oc_idx, b.pi_img1, b.pi_name, b.pi_price, b.pi_dc, b.pi_stock from t_order_cart a, t_product_info b where a.pi_id = b.pi_id and a.mi_id = 'test1';

select * from t_store_reply;

select * from t_store_reply where sr_isview = 'y' and si_id = 'AA528' order by sr_idx desc limit 10, 5;

insert into t_store_reply_gnb(mi_id, sr_idx, srg_gnb) values('test1', '4', '1');
delete from t_store_reply_gnb where sr_idx = 6 and mi_id = 'test1';

-- 즐겨찾기 폴더 테이블
create table t_bookmark_folder (
	bf_idx int primary key auto_increment,	-- 폴더 번호
    mi_id varchar(20) not null, 			-- 회원 아이디
	bf_title varchar(20) not null, 			-- 폴더명
    bf_cnt int  default 0, 		            -- 폴더 즐겨찾기 개수
    constraint fk_bookmark_folder_mi_id foreign key (mi_id) references t_member_info(mi_id)
); 

select * from t_bookmark_folder;

delete from t_bookmark_folder where mi_id = 'test' and bf_idx = 8;

select * from t_bookmark_folder where mi_id = 'test' order by bf_idx desc;

select bf_idx from t_bookmark_folder where mi_id = 'test' order by bf_idx desc limit 1;

update t_bookmark_folder set bf_cnt = 1 where mi_id = 'test' and bf_idx = (select bf_idx from t_bookmark_folder where mi_id = 'test' order by bf_idx desc limit 1);

select * from t_bookmark_folder where si_id is null;

update t_bookmark_folder set bf_cnt = 0 where mi_id = 'test' and bf_idx = 34;

insert into t_bookmark_folder(mi_id, bf_title, bf_cnt) values ('test', '맛집 폴더', 0);
insert into t_bookmark_folder(mi_id, bf_title, bf_cnt) values ('test', '맛집 폴더2', 0);
insert into t_bookmark_folder(si_id, mi_id, bf_title, bf_cnt) values ('', 'test', '맛집 폴더3', 0);

-- 나눈 이유 즐겨찾기 폴더 따로 마이페이지에서 for문 돌리고 그 안에서 이미지를 다시 for문 돌려야 하기 때문


create table t_bookmark_folder_images (
	bfi_idx int primary key auto_increment,	-- 폴더 이미지 번호
    bf_idx int not null, 					-- 폴더 번호
	si_id char(5) not null,                 -- 음식점ID
    bfi_img varchar(50) default '',			-- 이미지
    constraint fk_bookmark_folder_images_bf_idx foreign key (bf_idx) references t_bookmark_folder(bf_idx),
	constraint fk_bookmark_folder_images_si_id foreign key (si_id) references t_store_info(si_id)
); 

select * from t_bookmark_folder_images;

insert into t_bookmark_folder_images(bfi_idx, bf_idx, sb_idx ,si_id, bfi_img) values (1, 17, 29, 'AA925', '맛집 사진1.jpg');
insert into t_bookmark_folder_images(bfi_idx, bf_idx, sb_idx ,si_id, bfi_img) values (2, 17, 30, 'AA867', '라벤더1.jpg');
insert into t_bookmark_folder_images(bfi_idx, bf_idx, sb_idx ,si_id, bfi_img) values (3, 18, 31, 'BB220', '무늬 담쟁이3.jpg');

select a.*, b.mi_id from t_bookmark_folder_images a, t_bookmark_folder b where a.bf_idx = b.bf_idx and mi_id = 'test';

select a.*, b.mi_id from t_bookmark_folder_images a, t_bookmark_folder b, t_store_bookmark c where a.bf_idx = b.bf_idx and a.si_id = c.si_id and a.bf_idx = 17;
delete t_store_bookmark from t_store_bookmark join t_bookmark_folder_images a on t_store_bookmark.si_id = a.si_id join t_bookmark_folder b on a.bf_idx = b.bf_idx where a.bf_idx = 17;

delete t_bookmark_folder_images from t_bookmark_folder_images join t_store_bookmark a on t_store_bookmark.si_id = a.si_id join t_store_bookmark b on a.bf_idx = b.bf_idx where b.mi_id = 'test';

delete t_bookmark_folder_images from t_bookmark_folder_images join t_bookmark_folder on t_bookmark_folder_images.bf_idx = t_bookmark_folder.bf_idx where t_bookmark_folder.mi_id = 'test';

select * from t_bookmark_folder_images;


update t_bookmark_folder_images set bf_idx = 2 where si_id = 'AA867';
select a.*, b.mi_id, b.bf_title from t_bookmark_folder_images a, t_bookmark_folder b where a.bf_idx = b.bf_idx and mi_id = 'test';


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



