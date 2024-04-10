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