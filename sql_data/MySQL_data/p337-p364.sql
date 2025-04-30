-- p337

use compressDB;

CREATE TABLE normalTBL( emp_no int , first_name VARCHAR(14));
CREATE TABLE compressTBL( emp_no int , first_name VARCHAR(14))
ROW_FORMAT=COMPRESSED ;

INSERT INTO normalTbl
SELECT emp_no, first_name FROM employees.employees;
INSERT INTO compressTBL
SELECT emp_no, first_name FROM employees.employees;

show table status from compressDB;

drop database	if exists compressDB;

use tabledb;
alter table usertbl
	add homepage varchar(30) -- 열 추가
		default 'https://www.hanbit.co.kr' -- 디폴트 값
        null; -- null 허용함
        
alter table usertbl
	drop column mobile1;
    
alter table usertbl
	change column name uName varchar(20) null;
    
alter table usertbl
		drop primary key;
        
alter table buytbl
	drop foreign key buytbl_ibfk_1;
    
USE tabledb;
DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl
( userID  CHAR(8),
  name    VARCHAR(10),
  birthYear INT,
  addr    CHAR(2),
  mobile1 CHAR(3),
  mobile2 CHAR(8),
  height    SMALLINT,
  mDate     DATE
);

CREATE TABLE buytbl
( num int AUTO_INCREMENT PRIMARY KEY,
  userid CHAR(8),
  prodName CHAR(6),
  groupName CHAR(4),
  price INT,
  amount SMALLINT
);    

INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182,
                           '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', NULL, '경남', '011', '2222222', 173,
                           '2012-4-4');
                           INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177,
                           '2007-7-7');
INSERT INTO usertbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166,
                           '2009-4-4');
INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200, 1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '모니터', '전자', 200, 5);

ALTER TABLE usertbl
ADD CONSTRAINT PK_usertbl_userID
PRIMARY KEY (userID);

ALTER TABLE buytbl
ADD CONSTRAINT FK_usertbl_buytbl
FOREIGN KEY (userID)
REFERENCES usertbl (userID);

DELETE FROM buytbl WHERE userid = 'BBK';
ALTER TABLE buytbl
ADD CONSTRAINT FK_usertbl_buytbl
FOREIGN KEY (userID)
REFERENCES usertbl (userID);

SET foreign_key_checks = 0;
INSERT INTO buytbl VALUES(NULL, 'BBK', '모니터', '전자', 200, 5);
INSERT INTO buytbl VALUES(NULL, 'KBS', '청바지', '의류', 50, 3);
INSERT INTO buytbl VALUES(NULL, 'BBK', '메모리', '전자', 80, 10);
INSERT INTO buytbl VALUES(NULL, 'SSK', '책', '서적', 15, 5);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책', '서적', 15, 2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '청바지', '의류', 50, 1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL, 30, 2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책', '서적', 15, 1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL, 30, 2);
SET foreign_key_checks = 1;

UPDATE usertbl SET birthYear=1979 WHERE userID='KBS';
UPDATE usertbl SET birthYear=1971 WHERE userID='KKH';

INSERT INTO usertbl VALUES('TKV', '태권뷔', 2999, '우주', NULL, NULL , 186,
                           '2023-12-12');
                           
INSERT INTO usertbl VALUES('SSK', '성시경', 1979, '서울', NULL, NULL , 186,
                           '2013-12-12');
INSERT INTO usertbl VALUES('LJB', '임재범', 1963, '서울', '016', '6666666', 182,
                           '2009-9-9');
INSERT INTO usertbl VALUES('YJS', '윤종신', 1969, '경남', NULL, NULL , 170,
                           '2005-5-5');
INSERT INTO usertbl VALUES('EJW', '은지원', 1972, '경북', '011', '8888888', 174,
                           '2014-3-3');
INSERT INTO usertbl VALUES('JKW', '조관우', 1965, '경기', '018', '9999999', 172,
                           '2010-10-10');
INSERT INTO usertbl VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 176,
                           '2013-5-5');          
                           
                           SET foreign_key_checks = 0;
UPDATE usertbl SET userID = 'VVK' WHERE userID='BBK';
SET foreign_key_checks = 1;

SELECT B.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
  FROM buytbl B
 INNER JOIN usertbl U
    ON B.userid = U.userid ;
    
select count(*) from buytbl;

SELECT B.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
  FROM buytbl B
 LEFT OUTER JOIN usertbl U
    ON B.userid = U.userid
 ORDER BY B.userid ;    
 
 SET foreign_key_checks = 0;
UPDATE usertbl SET userID = 'BBK' WHERE userID='VVK';
SET foreign_key_checks = 1;

ALTER TABLE buytbl
DROP FOREIGN KEY FK_usertbl_buytbl;
ALTER TABLE buytbl
ADD CONSTRAINT FK_usertbl_buytbl
FOREIGN KEY (userID)
REFERENCES usertbl (userID)
ON UPDATE CASCADE;

UPDATE usertbl SET userID = 'VVK' WHERE userID='BBK';
SELECT B.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
  FROM buytbl B
  INNER JOIN usertbl U
   ON B.userid = U.userid
ORDER BY B.userid;

delete from usertbl where userID = 'VVK';

ALTER TABLE buytbl
DROP FOREIGN KEY FK_usertbl_buytbl;
ALTER TABLE buytbl
ADD CONSTRAINT FK_usertbl_buytbl
FOREIGN KEY (userID)
REFERENCES usertbl (userID)
ON UPDATE CASCADE
ON DELETE CASCADE;

DELETE FROM usertbl WHERE userID = 'VVK';
SELECT * FROM buytbl ;

ALTER TABLE usertbl
DROP COLUMN birthYear ;

USE tabledb;
CREATE VIEW v_usertbl
AS
SELECT userid, name, addr FROM usertbl;

select * from v_usertbl;

SELECT U.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
  FROM usertbl U
 INNER JOIN buytbl B
    ON U.userid = B.userid ;
    
CREATE VIEW v_userbuytbl
AS
SELECT U.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
  FROM usertbl U
 INNER JOIN buytbl B
    ON U.userid = B.userid ;
    
SELECT * FROM v_userbuytbl WHERE name = '김범수';

USE sqldb;
CREATE VIEW v_userbuytbl
AS
SELECT U.userid AS 'USER ID', U.name AS 'USER NAME', B.prodName AS 'PRODUCT NAME',
U.addr, CONCAT(U.mobile1, U.mobile2) AS 'MOBILE PHONE'
  FROM usertbl U
	INNER JOIN buytbl B
		ON U.userid = B.userid;

SELECT `USER ID`, `USER NAME` FROM v_userbuytbl; -- 주의! 백틱을 사용한다.    

drop view v_userbuytbl;

USE sqldb;
CREATE OR REPLACE VIEW v_usertbl
AS
SELECT userid, name, addr FROM usertbl;

describe v_usertbl;

show create view v_usertbl;

CREATE VIEW v_sum
AS
SELECT userid AS 'userid', SUM(price*amount) AS 'total'
  FROM buytbl GROUP BY userid;

SELECT * FROM v_sum;

SELECT * FROM INFORMATION_SCHEMA.VIEWS
 WHERE TABLE_SCHEMA = 'sqldb' AND TABLE_NAME = 'v_sum';
 
 CREATE VIEW v_height177
AS
SELECT * FROM usertbl WHERE height >= 177 ;

SELECT * FROM v_height177 ;

delete from v_height177 where height < 177 ;

SET SQL_SAFE_UPDATES = 0;

INSERT INTO v_height177 VALUES('KBM', '김병만', 1977, '경기', '010', '5555555', 158,
                             '2023-01-01') ;
                             
ALTER VIEW v_height177
AS
SELECT * FROM usertbl WHERE height >= 177
WITH CHECK OPTION ;

INSERT INTO v_height177 VALUES('SJH', '서장훈', 2006, '서울', '010', '3333333', 155,
                             '2023-3-3') ;            
                             
drop table if exists buytbl, usertbl;

select * from v_userbuytbl;

check table v_userbuytbl;

                             