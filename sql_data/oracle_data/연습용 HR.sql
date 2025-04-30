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
#15_1
SELECT *
FROM employees
WHERE salary > 4000
AND job_id='IT_PROG';
#15_2
SELECT *
FROM employees
WHERE salary > 4000
AND job_id='IT_PROG' 
OR job_id='F1_ACCOUNT';
#16
SELECT *
FROM employees
WHERE employee_id <>105;
#17 --여기서부터는 SQL에서 사용하는 함수
SELECT last_name, --대소문자 변경
lower(last_name) LOWER적용,
upper(last_name) UPPER적용,
email,
initcap(email) INITCAP적용
FROM employees;
#18 --시간 불러오기
SELECT sysdate, hire_date, months_between(sysdate, hire_date) 적용결과
FROM employees
WHERE department_id=100;
#19 --nvl 함수 사용: null값 처리
SELECT *
FROM employees
ORDER by commission_pct;
--nvl은 null값을 살리는데 사용
SELECT salary * NVL(commission_pct, 1)
FROM employees
ORDER by commission_pct;
#20
SELECT first_name,
last_name,
department_id, 
salary 원래급여,
DECODE(department_id, 60, salary*1.1, salary) 조정된_급여,
DECODE(department_id, 60, '10%인상', '미인상') 인상_여부
from employees;