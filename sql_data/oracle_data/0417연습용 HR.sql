#1
select A.employee_id, a.department_id, b.department_name, c.location_id, c.city
from employees A, departments B, locations C
where a.department_id = b.department_id
and b.location_id = c.location_id;

-- 일치한 내용만 보임
select count(*) 조인된_건수
from employees A, departments B
where a.department_id = b.department_id;

#2
select a.employee_id, a.first_name, a.last_name, b.department_id, b.department_name
from employees A, departments B
where a.department_id = b.department_id(+)
order by a.employee_id;

select a.employee_id, a.first_name, a.last_name, b.department_id, b.department_name
from employees A, departments B
where a.department_id(+) = b.department_id
order by a.employee_id;

#3
select a.employee_id, a.first_name, a.last_name, a.manager_id, b.first_name||' '||b.last_name manager_name
from employees A, employees B
where a.manager_id = b.employee_id
order by a.employee_id;

#4
select department_id
from employees
union
select department_id
from departments;

#5
select department_id
from employees
union all
select department_id
from departments;

#6
select department_id
from employees
intersect
select department_id
from departments;

#7
select department_id
from departments
minus
select department_id
from employees;

#8
select *
from employees A
where a.salary = (
    select salary
    from employees
    where last_name = 'De Haan'
    );
    
#9
select *
from employees A
where A.salary in (
    select min(salary) 최저급여
    from employees
    group by department_id)
order by a.salary desc;

#10
select *
from employees A
where (A.job_id, A.salary) in (
    select job_id, min(salary) 그룹별_급여
    from employees
    group by job_id)
order by a.salary desc;

#11
-- 인라인 뷰
select *
from employees A, (
    select department_id
    from departments
    where department_name='IT'
    ) B
where A.department_id = B.department_id;

#12
insert into departments (department_id, department_name, manager_id, location_id)
    values(271, 'Sample_Dept', 200, 1700);
    
select * from departments;

#13

#14
update departments
set department_id = 201,
    location_id = 1800
where department_name = 'Sample_Dept';

update departments
set department_id = 202,
    location_id = 1800
where department_name = 'Sample_Dept';

insert into departments (department_id, department_name, manager_id, location_id)
    values(271, 'Sample_Dept', 200, 1700);
    
select * from departments;

#15
delete from departments
where department_name = 'Sample_Dept'

#16
create table sample_product(
    product_id number,
    product_name varchar2(30),
    manu_date date);
