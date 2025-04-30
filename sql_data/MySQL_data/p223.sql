-- p223

USE sqldb;
CREATE TABLE testTbl4 (id int, Fname varchar(50), Lname varchar(50));
INSERT INTO testTbl4
SELECT emp_no, first_name, last_name
FROM employees.employees ;

USE sqldb;
CREATE TABLE testTbl5
(SELECT emp_no, first_name, last_name FROM employees.employees);

SET SQL_SAFE_UPDATES = 0;

UPDATE testTbl4
   SET Lname = '없음'
 WHERE Fname = 'Kyoichi';
 
 USE sqldb;
UPDATE buytbl SET price = price * 1.5 ;

USE sqldb;
DELETE FROM testTbl4 WHERE Fname = 'Aamer';