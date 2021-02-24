# lg_library_sn
# 데이터베이스 생성 스크립트

drop database if exists lg_library_sn;

create database if not exists lg_library_sn;

use lg_library_sn;
drop table if exists t_user;
drop table if exists t_posts;

CREATE TABLE t_user(
	User_Id varchar(30) NOT NULL,
	User_Name varchar(30) NOT NULL,
	Password char(32) NOT NULL,
	Created_At datetime NOT NULL,
	PRIMARY KEY (User_Id)
)CHARSET = utf8;

CREATE TABLE t_posts(
	Post_No int NOT NULL,
	User_Id varchar(30) NOT NULL,
	Title varchar(100) NOT NULL,
	Context varchar(1000) NOT NULL,
	Created_At datetime NOT NULL,
	Updated_At datetime NOT NULL,
	PRIMARY KEY (Post_No)
)CHARSET = utf8;

# 시퀀스 생성 스크립트
DROP SEQUENCE IF EXISTS s_posts;
CREATE SEQUENCE s_posts START WiTH 1 INCREMENT BY 1;


# 샘플데이터 생성 스크립트
USE lg_library_sn;
DELETE FROM t_user;
DELETE FROM t_posts;

INSERT INTO t_user VALUES ('aaa', 'Alice', '123456a!', CURRENT_TIMESTAMP);
INSERT INTO t_user VALUES ('bbb', 'Bora', '123456a!', CURRENT_TIMESTAMP);
INSERT INTO t_user VALUES ('ccc', 'Cathy', '123456a!', CURRENT_TIMESTAMP);

SELECT * FROM t_user;

INSERT INTO t_posts VALUES (nextval(s_posts), 'aaa', 'Title1','Content1,Content1,Content1.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO t_posts VALUES (nextval(s_posts), 'aaa', 'Title2','Content2,Content2,Content2.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO t_posts VALUES (nextval(s_posts), 'bbb', 'Title3','Content3,Content3,Content3.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO t_posts VALUES (nextval(s_posts), 'ccc', 'Title4','Content4,Content4,Content4.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO t_posts VALUES (nextval(s_posts), 'ccc', 'Title5','Content5,Content5,Content5.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

SELECT * FROM t_posts;