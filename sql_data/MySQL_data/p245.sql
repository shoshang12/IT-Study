USE sqldb ;
SELECT AVG(amount) AS '평균 구매 개수' FROM buytbl ;

SELECT CAST('2020$12$12' AS DATE);
SELECT CAST('2020/12/12' AS DATE);
SELECT CAST('2020%12%12' AS DATE);
SELECT CAST('2020@12@12' AS DATE);

SELECT num, CONCAT(CAST(price AS CHAR(10)), 'X', CAST(amount AS CHAR(4)), '=') AS
       '단가X수량',
       price*amount AS '구매액'
  FROM buytbl ;
  
USE sqldb;
SELECT * FROM usertbl;
SELECT FOUND_ROWS();

USE sqldb;
UPDATE buytbl SET price=price*2;
SELECT ROW_COUNT();

SELECT SLEEP(5);
SELECT '5초 후에 이게 보여요';

SET SQL_SAFE_UPDATES = 0;
