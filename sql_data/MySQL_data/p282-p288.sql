-- p282

USE sqldb;
CREATE TABLE stdTbl
( stdName  VARCHAR(10) NOT NULL PRIMARY KEY,
  addr     CHAR(4)     NOT NULL
);

CREATE TABLE clubTbl
( clubName VARCHAR(10) NOT NULL PRIMARY KEY,
  roomNo   CHAR(4)     NOT NULL
);

CREATE TABLE stdclubTbl
( num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  stdName VARCHAR(10) NOT NULL,
  clubName VARCHAR(10) NOT NULL,
  FOREIGN KEY (stdName) REFERENCES stdTbl(stdName),
  FOREIGN KEY (clubName) REFERENCES clubTbl(clubName)
);

INSERT INTO stdTbl VALUES ('김범수','경남'), ('성시경','서울'), ('조용필','경기'), ('은지원','경북'), ('바비킴','서울');
INSERT INTO clubTbl VALUES ('수영','101호'), ('바둑','102호'), ('축구','103호'), ('봉사','104호');
INSERT INTO stdclubTbl VALUES (NULL, '김범수','바둑'), (NULL,'김범수','축구'), (NULL,'조용필','축구'), (NULL,'은지원','축구'), (NULL,'은지원','봉사'), (NULL,'바비킴','봉사');

SELECT S.stdName, S.addr, C.clubName, C.roomNo
  FROM stdtbl S
 INNER JOIN stdclubtbl SC
	ON S.stdName = SC.stdName
INNER JOIN clubtbl C
    ON SC.clubName = C.clubName
ORDER BY S.stdName;

SELECT C.clubName, C.roomNo, S.stdName, S.addr
  FROM stdtbl S
 INNER JOIN stdclubtbl SC
    ON SC.stdName = S.stdName
 INNER JOIN clubtbl C
    ON SC.clubName = C.clubName
 ORDER BY C.clubName;
 
 USE sqldb;
SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
  FROM usertbl U
  LEFT OUTER JOIN buytbl B
    ON U.userID = B.userID
 ORDER BY U.userID;
 
 SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
  FROM buytbl B
 RIGHT OUTER JOIN usertbl U
    ON U.userID = B.userID
 ORDER BY U.userID;
 
 SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
  FROM usertbl U
  LEFT OUTER JOIN buytbl B
    ON U.userID = B.userID
 WHERE B.prodName IS NULL
 ORDER BY U.userID;
 
 USE sqldb;
SELECT S.stdName, S.addr, C.clubName, C.roomNo
  FROM stdtbl S
  LEFT OUTER JOIN stdclubtbl SC
    ON S.stdName = SC.stdName
  LEFT OUTER JOIN clubtbl C
    ON SC.clubName = C.clubName
 ORDER BY S.stdName;
 
 SELECT C.clubName, C.roomNo, S.stdName, S.addr
  FROM stdtbl S
  LEFT OUTER JOIN stdclubtbl SC
    ON SC.stdName = S.stdName
 RIGHT OUTER JOIN clubtbl C
    ON SC.clubName = C.clubName
 ORDER BY C.clubName ;
 
 SELECT S.stdName, S.addr, C.clubName, C.roomNo
  FROM stdtbl S
  LEFT OUTER JOIN stdclubtbl SC
    ON S.stdName = SC.stdName
  LEFT OUTER JOIN clubtbl C
    ON SC.clubName = C.clubName
UNION
SELECT S.stdName, S.addr, C.clubName, C.roomNo
  FROM stdtbl S
  LEFT OUTER JOIN stdclubtbl SC
    ON SC.stdName = S.stdName
 RIGHT OUTER JOIN clubtbl C
    ON SC.clubName = C.clubName;
    
    