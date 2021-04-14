select * from emp;
select * from dept;
select * from loc;
select * from job;

-- 1. 부서위치가 CHICAGO인 모든 사원에 대해 이름, 업무, 급여 출력하는 SQL
-- 시카고가 없음
select e.fname,e.JOBID,e.SALARY
from emp e join dept d
where e.deptid = d.deptid
and d.locid in (select locid from loc where city='Seattle');

-- 2. 부하직원이 없는 사원의 사원번호, 이름, 업무, 부서번호 출력하는 SQL을 작성
select empid,fname,jobid,deptid
from emp
where empid not in(select mgrid from emp);


-- 3. Irene와 같은 상사를 가진 사원의 이름, 업무, 상사번호 출력하는 SQL을 작성하세요.
select e.fname, d.deptname,e.mgrid
from emp e, dept d
where e.deptid=d.deptid
and e.mgrid=(select mgrid from emp where fname="Irene");

-- 4. 입사일이 가장 오래된 사람 5명을 검색하시오
select *
from emp
order by hdate asc
limit 5;

-- 5. Nancy 의 부하 직원의 이름, 업무, 부서명을 검색하시오.
select e.fname, d.deptname,e.jobid
from emp e, dept d
where e.deptid=d.deptid
and e.mgrid=(select empid from emp where fname="Nancy");



