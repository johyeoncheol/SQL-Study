use ssafydb;

-- 사번이 100인 사원의 사번, 이름 , 급여, 부서 이름
select employee_id,first_name,salary,department_id
from employees
where employee_id = 100
order by salary;

select department_name
from departments
where department_id=90;

select employee_id,first_name,salary,
employees.department_id,department_name
from employees, departments
where employees.department_id = departments.department_id
and employees.employee_id = 100;

-- from에서도 알리야스 적용이 가능하다.
select e.employee_id,e.first_name,e.salary,
e.department_id,d.department_name
from employees e, departments d
where e.department_id = d.department_id
and e.employee_id = 100;

-- inner join
select e.employee_id,e.first_name,e.salary,
e.department_id,d.department_name
from employees e inner join departments d
on e.department_id = d.department_id
where e.employee_id = 100;

-- inner join
select e.employee_id,e.first_name,e.salary,
e.department_id,d.department_name
from employees e inner join departments d
using (department_id)
where e.employee_id = 100;

select e.employee_id,e.first_name,e.salary,
e.department_id,d.department_name
from employees e natural join departments d
where e.employee_id = 100;

desc employees;

desc departments;

-- 부서번호가 10인 부서의 부서번호, 부서이름, 도시
select department_id, department_name,l.city
from departments d join locations l
on d.location_id = l.location_id
where d.department_id=10;

select department_id, department_name, l.city
from departments d natural join locations l
where d.department_id = 10;

-- 'seattle'에 근무하는 사원의 정보
-- 사원, 이름, 급여, 직급이름, 부서이름
select e.employee_id,e.first_name, e.salary,j.job_title,d.department_name
from employees e join jobs j
on e.job_id = j.job_id
join departments d
on e. department_id = d.department_id
join locations l
on d.location_id = l.location_id 
where lcase(city) = lcase('seattle')
union
select e.employee_id,e.first_name, e.salary,j.job_title,d.department_name
from employees e join jobs j
on e.job_id = j.job_id
join departments d
on e. department_id = d.department_id
join locations l
on d.location_id = l.location_id 
where lcase(city) = lcase('toronto')
order by salary desc;

select *
from employees
where department_id is null;

-- 회사에 근무하는 모든 사원이 사번, 이름 부서 이름
select e.employee_id, e.first_name, ifnull(d.department_name,"대기발령중")
from employees e left outer join departments d
on e.department_id = d.department_id;

-- 회사의 모든 부서에 근무하는 사원의 부서번호, 부서이름, 사번, 이름
select d.department_id, d.department_name, e.employee_id, e.first_name
from employees e join departments d
on e.department_id = d.department_id;

select count(department_id)
from departments; 

select count(distinct department_id)
from employees;

-- 회사에 근무하는 모든 사원이 사번, 이름 부서 이름
select e.employee_id eid, e.first_name name, d.department_id did, ifnull(d.department_name,"대기발령중") dname
from employees e left outer join departments d
on e.department_id = d.department_id
union
select e.employee_id, e.first_name,d.department_id,d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id;

select *
from locations;

-- 사원의 사번, 이름, 상관의 이름(self join 자기자신의 테이블을 조회해서 알아냄)
select e.employee_id, e.first_name,e.manager_id,m.employee_id,m.first_name
from employees e left outer join employees m
on e.manager_id = m.employee_id;

-- 모든 사원의 사번, 이름, 급여, 급여 등급
select e.employee_id,e.first_name,e.salary,s.grade
from employees e join salgrades s
on	e.salary >= s.losal
and e.salary <= s.hisal;

-- 모든 사원의 사번, 이름, 급여, 급여 등급
select e.employee_id,e.first_name,e.salary,s.grade
from employees e join salgrades s
on	e.salary between s.losal and s.hisal
order by grade desc;

-- 사번이 101번인 사원의 근무 이력
-- 사번, 이름, 부서이름, 시작일, 종료일
-- 날짜 : 00.00.00
select e.employee_id, e.first_name,d.department_name,j.job_title,
date_format(h.start_date,"%y.%m.%d"),date_format(h.end_date,"%y.%m.%d")
from employees e join job_history h
on e.employee_id = h.employee_id
join departments d
on h.department_id = d.department_id
join jobs j
on h.job_id = j.job_id
where e.employee_id =101;

select *
from job_history
where employee_id = 101;

select employee_id, first_name,hire_date
from employees
where employee_id = 101;

select *
from job_history;