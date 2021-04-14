use testdb;

# 함수
-- 1. 집계함수: count(), sum(),avg(), min(),max()
select count(*), avg(salary), max(salary)
from emp;

-- 2. 숫자 관련 함수
select ceil(8.9), floor(8.9), round(8.9); # 올림
select greatest(100,34,888),least(100,34,888);

-- 3. 문자열 관련 함수
select empid, concat(fname,' ',lname) name
from emp;

select fname, replace(fname, 'e','x') name
from emp;

select fname,substring(fname,1,2) name
from emp;

-- 4. 날짜/시간 관련 함수
select now(), sysdate(), curdate(), curtime();
select now(), date_add(now(),interval 1 second);
select year(now()), month(now()),monthname(now()),dayofweek(now());

-- 5. json
select json_object('num',empid,'name',fname) obj
from emp;

# group by(~별)
-- 부서별, 업무별
select deptid 부서번호, jobid, round(avg(salary), 2) 평균연봉, count(*) 인원
from emp
where deptid>=40
group by deptid, jobid
having 인원 >= 5
order by deptid;

