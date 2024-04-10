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

