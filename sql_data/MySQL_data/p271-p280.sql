-- p271~

USE sqldb;
SELECT JSON_OBJECT('name', name, 'height', height) AS 'JSON 값'
  FROM usertbl
 WHERE height >= 180;
 
 SET @json='{ "usertbl" :
[
    {"name":"임재범", "height":182},
    {"name":"이승기", "height":182},
    {"name":"성시경", "height":186}
]
}';
SELECT JSON_VALID(@json) AS JSON_VALID;
SELECT JSON_SEARCH(@json, 'one', '성시경') AS JSON_SEARCH;
SELECT JSON_EXTRACT(@json, '$.usertbl[2].name') AS JSON_EXTRACT;
SELECT JSON_INSERT(@json, '$.usertbl[0].mDate', '2009-09-09') AS JSON_INSERT;
SELECT JSON_REPLACE(@json, '$.usertbl[0].name', '홍길동') AS JSON_REPLACE;
SELECT JSON_REMOVE(@json, '$.usertbl[0]') AS JSON_REMOVE;

USE sqldb;
SELECT *
  FROM buytbl
 INNER JOIN usertbl
    ON buytbl.userID = usertbl.userID
 WHERE buytbl.userID = 'JYP';
 
 USE sqldb;
SELECT *
  FROM buytbl
 INNER JOIN usertbl
    ON buytbl.userID = usertbl.userID
 ORDER BY num;
 
 SELECT buytbl.userID, name, prodName, addr, CONCAT(mobile1, mobile2) AS '연락처'
  FROM buytbl
 INNER JOIN usertbl
    ON buytbl.userID = usertbl.userID
 ORDER BY num;
 
 SELECT buytbl.userID, usertbl.name, buytbl.prodName, usertbl.addr,
       CONCAT(usertbl.mobile1, usertbl.mobile2) AS '연락처'
  FROM buytbl
 INNER JOIN usertbl
    ON buytbl.userID = usertbl.userID
 ORDER BY buytbl.num;
 
	SELECT B.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
  FROM buytbl B
 INNER JOIN usertbl U
    ON B.userID = U.userID
 WHERE B.userID = 'JYP';
 
 SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
  FROM usertbl U
 INNER JOIN buytbl B
    ON U.userID = B.userID
 WHERE B.userID = 'JYP';
 
 SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
  FROM usertbl U
 INNER JOIN buytbl B
    ON U.userID = B.userID
 ORDER BY U.userID;
 
 SELECT DISTINCT U.userID, U.name, U.addr
  FROM usertbl U
 INNER JOIN buytbl B
    ON U.userID = B.userID
 ORDER BY U.userID ;
 
 SELECT U.userID, U.name, U.addr
  FROM usertbl U
 WHERE EXISTS (
        SELECT *
          FROM buytbl B
         WHERE U.userID = B.userID );
         
         