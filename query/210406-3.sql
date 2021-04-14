use testdb;

#join
-- cross join
create table tmp
as
select empid, fname, deptname
from emp;

drop table tmp;

-- empid, fname, deptname
select e.empid, fname, deptname
from emp e, dept d
where e.deptid = d.deptid
order by empid;

-- join~using(공통 컬럼명)
select empid,fname,deptname
from emp e join dept d
using (deptid)
order by empid;

-- empid, fname, deptname, jobtitle
select empid,fname,deptname,jobtitle
from emp e, dept d,job j
where e.deptid = d.deptid
and e.jobid = j.jobid
order by empid;

-- empid, fname, deptname, jobtitle
select empid,fname,deptname,jobtitle
from emp e join dept d
on e.deptid = d.deptid
join job j
on e.jobid = j.jobid
order by empid;

-- empid, fname, deptname, salary, jobid, jobtitle
-- salary 15000 ~20000
select empid, fname, deptname, salary, jobid, jobtitle
from emp e, dept d, job j
where salary between 15000 and 20000
and e.deptid = d.deptid
and e.jobid = j.jobid
order by empid;

select * from dept;
select * from emp;

-- 부서별 관리 직원의 이름 (부서 id, 부서명, 부서관리직원이름)
select d.deptname
from emp e, dept  d
where d.mgrid = e.empid
order by 1;

# outer join
-- null 값으로 인해 조인조건에서 빠지는 레코드도 다같이 포함시켜 주는 조인
-- 데이터가 많은쪽을 right나 left로 언급을 해줘야 한다.
-- outer은 생략이 가능하다.
select empid, fname, deptname
from emp e left outer join dept d
on e.deptid = d.deptid 
order by empid;

-- 2. 27건
select d.deptid, d.deptname, e.fname
from emp e right join dept d
on d.mgrid = e.empid
order by 1;

select * from emp;
select * from dept;
select * from loc;

-- 3. empid, fname, deptname, city(107건)
-- 누가 널값을 가지고 있냐에 따라서 left right를 붙여줘야 한다.
select e.empid, e.fname, d.deptname, city
from emp e left join dept d
on e.deptid = d.deptid
left join loc c
on c.locid = d.locid
order by empid;

# self join
-- 자기자신의 테이블을 가지고 조인
-- 자신의 매니저 정보
select e1.empid, e1.fname,e2.fname
from emp e1 join emp e2
on e1.mgrid = e2.empid;

-- 자신의 매니저 정보 (매니저 연봉. 매니저 연봉이 15000이상인)
select e1.empid, e1.fname, e2.empid, e2.fname, e2.salary
from emp e1, emp e2
where e2.salary >= 15000
and e1.mgrid = e2.empid
order by 5;
