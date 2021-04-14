use testdb;

-- create table creation

create table test(id int primary key,
name varchar(10) not null);

insert into test values(1,'tommy');

select * from loc;
select * from job;
select * from dept;
select * from emp;

select * from test;

-- alter table
-- add column
alter table test add(tel varchar(11));
desc test;

-- tel modify
alter table test modify tel varchar(13); 

-- delete tel
alter table test drop tel;

-- table drop
drop table test;

-- 1) pk 지정하기
alter table table_name
add constraint pk_name primary key (column_name);

-- emp 테이블에 pk 지정하기
alter table emp
add constraint pk_emp primary key (empid);

-- dept(deptid)
alter table dept
add constraint pk_dept primary key (deptid);

-- job(jobid)
alter table job
add constraint pk_job primary key (jobid);

-- loc(locid)
alter table loc
add constraint pk_loc primary key (locid);

-- fk(다른 테이블의 칼럼을 참고하는 키)
-- emp 테이블 -> jobid
alter table emp
add constraint emp_fk1 foreign key(jobid)
references job(jobid);

-- emp 테이블 -> deptid
alter table emp
add constraint emp_fk2 foreign key(deptid)
references dept(deptid);

-- dept -> (locid)
alter table emp
add constraint emp_fk2 foreign key(locid)
references loc(locid);

-- dept -> (mgrid)
alter table emp
add constraint emp_fk2 foreign key(deptid)
references dept(deptid);

-- Table Creation
-- 1. members(mid:pk, name, tel, addr)
-- 2. orders(oid:pk, mid(fk), odate (timestamp), payment)
-- 3. fk 지정: orders(mid)

drop table members;
drop table orders;


-- 부모 테이블
create table members (mid varchar(10) primary key, 
name varchar(15) not null,
 tel varchar(20) not null, 
 addr varchar(30) not null);


-- 자식 테이블
create table orders (
oid int primary key, 
mid varchar(10),
odate timestamp default current_timestamp, 
payment varchar(13) default 'money wire' not null,
constraint pcheck check(payment in ('credit card','money wire','point')));

-- insert(부모 먼저, 자식 나중)
-- delete(자식 먼저, 부모 나중)
-- insert into members(다 넣지 않는 경우에는 넣어줘야 한다.) values();
 insert into members values('tom','tom kim','010-1234','seoul');
insert into orders(oid,mid,payment) values(1,'tom','point');

select * from members;
select * from orders;

-- fk
-- fk를 지정할 때 on delete cascade 를 지정하면 부모 테이블 삭제시 
-- 자식테이블 데이터까지 자동으로 삭제가 된다.
alter table orders 
add constraint orders_fk foreign key(mid)
references members(mid) on delete cascade;






