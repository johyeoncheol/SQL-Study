use testdb;

# view: 가상 테이블 (view를 만들기 위한 쿼리문장만 저장되어 있음)
create or replace view emp50
as
select empid,fname,email,salary
from emp
where deptid=50;

select empid, fname, salary
from emp50
where salary >= 7000;

-- empid, fname, deptid, deptname
create view empdept
as
select empid, fname, e.deptid, deptname
from emp e, dept d
where e.deptid = d.deptid;

desc empdept;

-- emp50: empid, fname, email, salary, deptid
create or replace view emp50
as
select empid,fname,email,salary,deptid
from emp
where deptid=50;

-- err (non-updatable view)
insert into emp50 values(777,'bill','bill',15000,30);

-- check option을 가진 뷰
create or replace view emp_2050
as
select empid, fname, lname, hdate, jobid ,deptid
from emp
where deptid in (20,50)
with check option;

select count(*) from emp_2050;
 
insert into emp50 values(888,'kim','genie',sysdate(),'IT_PROG',60);

select * from emp50;

#index
create index jobid_idx on emp(deptid);
 
#function
select fname, comm, if(comm,1,0) 'if', ifnull(comm,'none') 'ifnull', coalesce(comm,'none') 'coalesce'
from emp;

select empid, fname, salary,
	case
		when salary > 15000 then 'high'
        when salary > 8000 then 'mid'
        else 'low'
	end grade
    from emp;

 
 
 
 
 
 