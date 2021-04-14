select @@sql_mode;

set session sql_mode = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION,ONLY_FULL_GROUP_BY';

use ssafydb;

select department_id,count(employee_id),sum(salary)
from employees
group by department_id;

select department_id,job_id,count(employee_id),sum(salary)
from employees
group by department_id,job_id;