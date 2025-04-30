select * from employees ;
select employee_id, first_name, last_name from employees ;
select employee_id, first_name, last_name from employees order by employee_id desc;
#4
select distinct job_id from employees;

SELECT employee_id as 사원번호, first_name as 성명
FROM employees
ORDER BY employee_id DESC;
#5
SELECT employee_id, first_name||' '||last_name fullname from employees;
#6
SELECT employee_id, first_name||last_name||'@company.com' email from employees;
#7
SELECT employee_id, salary, salary+5000, salary-100, (salary*1.1)/2 from employees;
#8
SELECT *
FROM employees
WHERE employee_id=100;
#9
SELECT *
FROM employees
WHERE first_name='David';
#10
select *
FROM employees
WHERE employee_id >=105;
#11
SELECT *
FROM employees
WHERE salary BETWEEN 10000 and 20000;
#12
SELECT *
FROM employees
WHERE salary in(10000, 17000, 24000);
#13_1
SELECT *
FROM employees
WHERE job_id LIKE 'AD%';
#13_2
-- 언버바 3개 추가
SELECT *
FROM employees
WHERE job_id LIKE 'AD___';
#14
 SELECT *
FROM employees
WHERE manager_id IS NULL;