select * from employees;

-- 사번 이름 급여
select employee_id, first_name, salary
from employees;

-- 사원이 근무하는 부서번호
select distinct department_id
from employees;

select employee_id eid, salary as "sal", department_id "부서 번호", sum(salary) "급여종합"
from employees;


-- 사번, 급여, 급여 1000인상, 연봉
select employee_id, salary, salary +1000, salary*12, commission_pct,(salary + salary*commission_pct)*12
from employees;

select *
from employees
where department_id < any (select department_id from  departments where location_id=1700);

select *
from  departments
where location_id=1700;

select location_id
from loactions
where city='Seattle';

select max(department_id)
from departments 
where department_id=270;

select employee_id , first_name, salary
from employees
order by salary desc;

select count(employee_id), sum(salary),avg(salary), max(salary),min(salary)
from employees;

select department_id, avg(salary)
from employees
group by department_id;

use ssafydb;

drop table trtest;

create table trtest
( col varchar(1));

insert into trtest value('a');

commit;

insert into trtest value('b');

select * from trtest;

rollback;

insert into trtest value('c');

insert into trtest value('d');

savepoint a1;

insert into trtest value('e');

insert into trtest value('f');

savepoint a2;

insert into trtest value('g');

insert into trtest value('h');

insert into trtest value('i');

select * from trtest;

rollback to a2;

commit;

rollback;










