#1
SELECT employee_id, first_name, last_name, salary,
    CASE
        WHEN salary >=9000 THEN '상위급여'
        WHEN salary BETWEEN 6000 AND 8999 THEN '중위급여'
        ELSE '하위급여'
    END AS 급여등급
FROM employees
WHERE job_id='IT_PROG';

#2
SELECT employee_id,
salary,
rank() over(order by salary desc) RANK_급여,
dense_rank() over(order by salary desc) DENSE_RANK_급여,
row_number() over(order by salary desc) ROW_NUMBER_급여
FROM employees;

#3 
SELECT COUNT(salary) salary행수
FROM employees;

#4
SELECT SUM(salary) 합계, avg(salary) 평균, sum(salary)/count(salary) 계산된_평균
FROM employees;

#5
SELECT max(salary) 최대값, min(salary) 최소값, max(first_name) 최대문자값, min(first_name) 최소문자값
FROM employees;

#6
SELECT job_id 직무, sum(salary) 직무별_총급여, avg(salary) 직무별_평균급여
FROM employees
WHERE employee_id >= 10
GROUP BY job_id
HAVING SUM(salary) > 30000
ORDER BY 직무별_총급여 DESC, 직무별_평균급여;