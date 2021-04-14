use startwars;

# database(schema) 생성하는 ddl
-- CREATE SCHEMA 'starwars' DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;

-- 1. starwars
CREATE TABLE starwars (
	episodeid INT ,
	episodename VARCHAR(50) ,
	openyear INT );
    
-- 2. characters
CREATE TABLE characters (
	characterid INT ,
	charactername VARCHAR(30) ,
	masterid INT ,
    roleid INT ,
    email VARCHAR(40) 
    );
    
-- 3. casting
CREATE TABLE casting (
	episodeid INT ,
	characterid int,
	realname varchar(30));
    
-- 4. roles
CREATE TABLE roles (
	roleid int,
    rolename varchar(30));
    
# pk, fk 지정
alter table starwars add constraint starwars_pk primary key (episodeid);
alter table characters add constraint characters_pk primary key (characterid);
alter table roles add constraint roles_pk primary key (roleid);
alter table casting add constraint casting_pk primary key (episodeid,characterid);

alter table characters add constraint characters_fk
foreign key(roleid) references roles(roleid);

alter table casting add constraint characters_fk1
foreign key(episodeid) references starwars(episodeid);

alter table casting add constraint casting_fk2
foreign key(characterid) references characters(characterid);

# data insert
-- 4. insert STARWARS--------------------------------
INSERT INTO STARWARS ( EPISODEID, EPISODENAME, OPENYEAR)
VALUES ( 4, '새로운 희망(A New Hope)', 1977);

INSERT INTO STARWARS ( EPISODEID, EPISODENAME, OPENYEAR)
VALUES ( 5, '제국의 역습(The Empire Strikes Back)', 1980);

INSERT INTO STARWARS ( EPISODEID, EPISODENAME, OPENYEAR)
VALUES ( 6, '제다이의 귀환(Return of the Jedi)', 1983);

INSERT INTO STARWARS ( EPISODEID, EPISODENAME, OPENYEAR)
VALUES ( 1, '보이지 않는 위험(The Phantom Menace)', 1999);

INSERT INTO STARWARS ( EPISODEID, EPISODENAME, OPENYEAR)
VALUES ( 2, '클론의 습격(Attack of the Clones)', 2002);

INSERT INTO STARWARS ( EPISODEID, EPISODENAME, OPENYEAR)
VALUES ( 3, '시스의 복수(Revenge of the Sith)', 2005);

-- 5. CHARACTERS ---------------------------------------
INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 1, '루크 스카이워커','luke@jedai.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 2, '한 솔로', 'solo@alliance.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 3, '레이아 공주', 'leia@alliance.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 4, '오비완 케노비', 'Obi-Wan@jedai.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 5, '다스 베이더', 'vader@sith.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 6, '다스 베이더(목소리)', 'vader-voice@alliance.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 7, 'C-3PO', 'c3po@alliance.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 8, 'R2-D2', 'r2d2@alliance.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 9, '츄바카', 'Chewbacca@alliance.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 10, '랜도 칼리시안', 'Chewbacca@alliance.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 11, '요다', 'yoda@jedai.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 12, '다스 시디어스', NULL);

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 13, '아나킨 스카이워커', 'Anakin@jedai.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 14, '콰이곤 진', NULL);

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 15, '아미달라 여왕', NULL);

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 16, '아나킨 어머니', NULL);

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 17, '자자빙크스(목소리)', 'jaja@jedai.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 18, '다스 몰', NULL);

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 19, '장고 펫', NULL);

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 20, '마스터 윈두', 'windu@jedai.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 21, '듀크 백작', 'dooku@jedai.com');


-- 6. CASTING--------------------------------
INSERT INTO CASTING VALUES ( 4, 1, '마크 해밀');
INSERT INTO CASTING VALUES ( 4, 2, '해리슨 포드');
INSERT INTO CASTING VALUES ( 4, 3, '캐리 피셔');
INSERT INTO CASTING VALUES ( 4, 4, '알렉 기네스');
INSERT INTO CASTING VALUES ( 4, 5, '데이비드 프로우즈');
INSERT INTO CASTING VALUES ( 4, 6, '제임스 얼 존스');
INSERT INTO CASTING VALUES ( 4, 7, '안소니 다니엘스');
INSERT INTO CASTING VALUES ( 4, 8, '케니 베이커');
INSERT INTO CASTING VALUES ( 4, 9, '피터 메이휴');
INSERT INTO CASTING VALUES ( 5, 1, '마크 해밀');
INSERT INTO CASTING VALUES ( 5, 2, '해리슨 포드');
INSERT INTO CASTING VALUES ( 5, 3, '캐리 피셔');
INSERT INTO CASTING VALUES ( 5, 4, '알렉 기네스');
INSERT INTO CASTING VALUES ( 5, 5, '데이비드 프로우즈');
INSERT INTO CASTING VALUES ( 5, 6, '제임스 얼 존스');
INSERT INTO CASTING VALUES ( 5, 7, '안소니 다니엘스');
INSERT INTO CASTING VALUES ( 5, 8, '케니 베이커');
INSERT INTO CASTING VALUES ( 5, 9, '피터 메이휴');
INSERT INTO CASTING VALUES ( 5, 10, '빌리 디 윌리엄스');
INSERT INTO CASTING VALUES ( 5, 11, '프랭크 오즈');
INSERT INTO CASTING VALUES ( 6, 1, '마크 해밀');
INSERT INTO CASTING VALUES ( 6, 2, '해리슨 포드');
INSERT INTO CASTING VALUES ( 6, 3, '캐리 피셔');
INSERT INTO CASTING VALUES ( 6, 4, '알렉 기네스');
INSERT INTO CASTING VALUES ( 6, 5, '데이비드 프로우즈');
INSERT INTO CASTING VALUES ( 6, 6, '제임스 얼 존스');
INSERT INTO CASTING VALUES ( 6, 7, '안소니 다니엘스');
INSERT INTO CASTING VALUES ( 6, 8, '케니 베이커');
INSERT INTO CASTING VALUES ( 6, 9, '피터 메이휴');
INSERT INTO CASTING VALUES ( 6, 10, '빌리 디 윌리엄스');
INSERT INTO CASTING VALUES ( 6, 11, '프랭크 오즈');
INSERT INTO CASTING VALUES ( 6, 12, '이언 맥디어미드');
INSERT INTO CASTING VALUES ( 1, 13, '제이크 로이드');
INSERT INTO CASTING VALUES ( 1, 4, '이완 맥그리거');
INSERT INTO CASTING VALUES ( 1, 14, '리암 니슨');
INSERT INTO CASTING VALUES ( 1, 15, '나탈리 포트만');
INSERT INTO CASTING VALUES ( 1, 11, '프랭크 오즈');
INSERT INTO CASTING VALUES ( 1, 16, '페닐라 어거스트');
INSERT INTO CASTING VALUES ( 1, 12, '이언 맥디어미드');
INSERT INTO CASTING VALUES ( 1, 7, '안소니 다니엘스');
INSERT INTO CASTING VALUES ( 1, 8, '케니 베이커');
INSERT INTO CASTING VALUES ( 1, 17, '아흐메드 베스트');
INSERT INTO CASTING VALUES ( 1, 18, '레이 파크');
INSERT INTO CASTING VALUES ( 2, 4, '이완 맥그리거');
INSERT INTO CASTING VALUES ( 2, 15, '나탈리 포트만');
INSERT INTO CASTING VALUES ( 2, 13, '헤이든 크리스텐슨');
INSERT INTO CASTING VALUES ( 2, 11, '프랭크 오즈');
INSERT INTO CASTING VALUES ( 2, 12, '이언 맥디어미드');
INSERT INTO CASTING VALUES ( 2, 16, '페닐라 어거스트');
INSERT INTO CASTING VALUES ( 2, 17, '아흐메드 베스트');
INSERT INTO CASTING VALUES ( 2, 7, '안소니 다니엘스');
INSERT INTO CASTING VALUES ( 2, 8, '케니 베이커');
INSERT INTO CASTING VALUES ( 2, 19, '테무엘라 모리슨');
INSERT INTO CASTING VALUES ( 2, 20, '사무엘 L. 잭슨');
INSERT INTO CASTING VALUES ( 2, 21, '크리스토퍼 리');
INSERT INTO CASTING VALUES ( 3, 4, '이완 맥그리거');
INSERT INTO CASTING VALUES ( 3, 15, '나탈리 포트만');
INSERT INTO CASTING VALUES ( 3, 13, '헤이든 크리스텐슨');
INSERT INTO CASTING VALUES ( 3, 11, '프랭크 오즈');
INSERT INTO CASTING VALUES ( 3, 12, '이언 맥디어미드');
INSERT INTO CASTING VALUES ( 3, 17, '아흐메드 베스트');
INSERT INTO CASTING VALUES ( 3, 7, '안소니 다니엘스');
INSERT INTO CASTING VALUES ( 3, 8, '케니 베이커');
INSERT INTO CASTING VALUES ( 3, 19, '테무엘라 모리슨');
INSERT INTO CASTING VALUES ( 3, 20, '사무엘 L. 잭슨');
INSERT INTO CASTING VALUES ( 3, 21, '크리스토퍼 리');  

-- 7. roles--------------------------------
INSERT INTO roles VALUES ( 1001, '제다이');  
INSERT INTO roles VALUES ( 1002, '시스');  
INSERT INTO roles VALUES ( 1003, '반란군');  










