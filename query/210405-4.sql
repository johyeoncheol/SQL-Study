
select empid, fname,salary
from emp
order by salary desc, empid desc;

-- alias

select *
from emp
where deptid > 30
order by 이름;


select empid, fname, deptid
from emp
where deptid is not null;

select empid, fname, deptid
from emp
where deptid in (10,20,30); -- or

-- like

-- %는 글자 길이와는 상관이 없다.
select empid, fname
from emp
where fname like 'A%'; -- A로 시작하는

select empid, fname
from emp
where fname like 'A___'; -- _ 3번

-- \% 는 글자 자체에 %가 들어가는 경우를 출력한다.
-- 'A\%%'의 경우 A%____를 의미한다.
insert into emp(empid, fname) values(999,'A%d');

select empid, fname
from emp
where fname like 'A\%%'; -- _ 3번

-- 그룹(집계) 함수: max(), min(), avg(), count(), sum()
-- round도 시험에 잘 나온다 보고싶은 소수점을 볼때 사용하면 된다.
select max(salary), min(salary), round(avg(salary),2)
from emp;

select avg(salary), fname
from emp; -- err

-- group by(그룹 나눠서 쿼리). ~별
-- 부서별 인원수 
select deptid, count(fname)
from emp
where deptid is not null
group by deptid
order by 2 desc; 

-- 업무별 평균 연봉(업무 id,연봉)
select jobid, round(avg(salary),1)
from emp
group by jobid
order by 2 desc;

-- 5명 이상인 부서만 (그룹에 조건을 걸 때)
-- group by로 그룹을 나눠 작업할 때는 select절에 나온 값 중에서
-- 그룹함수를 제외한 모든 칼럼이 group by에 나와줘야 함
select deptid,jobid, count(*)
from emp
where deptid is not null
group by deptid
-- having count(*)>= 5
order by 2 desc; 
