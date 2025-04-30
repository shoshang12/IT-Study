-- p314

DROP DATABASE IF EXISTS ShopDB;
DROP DATABASE IF EXISTS ModelDB;
DROP DATABASE IF EXISTS sqldb;
DROP DATABASE IF EXISTS tabledb;

CREATE TABLE `tabledb`.`buytbl` (
  `num` INT NOT NULL AUTO_INCREMENT,
  `userid` CHAR(8) NOT NULL,
  `prodName` CHAR(6) NOT NULL,
  `groupName` CHAR(4) NULL,
  `price` INT NOT NULL,
  `amount` SMALLINT NOT NULL,
  PRIMARY KEY (`num`),
  FOREIGN KEY (userid) REFERENCES usertbl(userID)
);

USE tabledb;
DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl -- 회원 테이블
( userID  CHAR(8), -- 사용자 아이디
  name    VARCHAR(10), -- 이름
  birthYear INT,  -- 출생년도
  addr    CHAR(2), -- 지역(경기, 서울, 경남 등으로 2글자만 입력)
  mobile1 CHAR(3), -- 휴대폰의 국번(011, 016, 017, 018, 019, 010 등)
  mobile2 CHAR(8), -- 휴대폰의 나머지 전화번호(하이픈 제외)
  height    SMALLINT, -- 키
  mDate     DATE      -- 회원 가입일
);

CREATE TABLE buytbl -- 구매 테이블
( num       INT,       -- 순번(PK)
  userid    CHAR(8),   -- 아이디(FK)
  prodName  CHAR(6),   -- 물품명
  groupName CHAR(4),   -- 분류
  price     INT,       -- 단가
  amount    SMALLINT   -- 수량
);

USE tabledb;
DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl
( userID  CHAR(8) NOT NULL ,
  name    VARCHAR(10) NOT NULL,
  birthYear INT  NOT NULL,
  addr    CHAR(2) NOT NULL,
  mobile1 CHAR(3) NULL,
  mobile2 CHAR(8) NULL,
  height    SMALLINT NULL,
  mDate     DATE NULL
);

CREATE TABLE buytbl
( num       INT NOT NULL ,
  userid    CHAR(8) NOT NULL ,
  prodName  CHAR(6) NOT NULL,
  groupName CHAR(4) NULL,
  price     INT NOT NULL,
  amount    SMALLINT NOT NULL
);

USE tabledb;
DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl
( userID  CHAR(8) NOT NULL PRIMARY KEY,
  name    VARCHAR(10) NOT NULL,
  birthYear INT  NOT NULL,
  addr    CHAR(2) NOT NULL,
  mobile1 CHAR(3) NULL,
  mobile2 CHAR(8) NULL,
  height    SMALLINT NULL,
  mDate     DATE NULL
);

CREATE TABLE buytbl
( num       INT NOT NULL PRIMARY KEY,
  userid    CHAR(8) NOT NULL ,
  prodName  CHAR(6) NOT NULL,
  groupName CHAR(4) NULL,
  price     INT NOT NULL,
  amount    SMALLINT NOT NULL,
  FOREIGN KEY (userid) REFERENCES usertbl(userID)
);

DROP TABLE IF EXISTS buytbl;
CREATE TABLE buytbl
( num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  userid CHAR(8) NOT NULL ,
  prodName CHAR(6) NOT NULL,
  groupName CHAR(4) NULL ,
  price INT NOT NULL,
  amount SMALLINT NOT NULL
);

DROP TABLE IF EXISTS buytbl;
CREATE TABLE buytbl
( num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  userid CHAR(8) NOT NULL ,
  prodName CHAR(6) NOT NULL,
  groupName CHAR(4) NULL ,
  price INT NOT NULL,
  amount SMALLINT NOT NULL,
  FOREIGN KEY(userid) REFERENCES usertbl(userID)
);

INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182,
                           '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173,
                           '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177,
                           '2007-7-7');
                           
INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200, 1);                           

USE tableDB;
DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE userTBL
( userID  CHAR(8) NOT NULL PRIMARY KEY,
  name    VARCHAR(10) NOT NULL,
  birthYear INT NOT NULL
);

describe usertbl;

DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL
( userID  CHAR(8) NOT NULL,
  name    VARCHAR(10) NOT NULL,
  birthYear INT NOT NULL,
  CONSTRAINT PRIMARY KEY PK_userTBL_userID (userID)
);

DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL
( userID  CHAR(8) NOT NULL,
  name    VARCHAR(10) NOT NULL,
  birthYear INT NOT NULL
);

ALTER TABLE userTBL
ADD CONSTRAINT PK_userTBL_userID
PRIMARY KEY (userID);

DROP TABLE IF EXISTS prodTbl;
CREATE TABLE prodTbl
( prodCode CHAR(3) NOT NULL,
  prodID   CHAR(4) NOT NULL,
  prodDate DATETIME NOT NULL,
  prodCur  CHAR(10) NULL
);

ALTER TABLE prodTbl
ADD CONSTRAINT PK_prodTbl_prodCode_prodID
PRIMARY KEY (prodCode, prodID) ;

DROP TABLE IF EXISTS prodTbl;
CREATE TABLE prodTbl
( prodCode CHAR(3) NOT NULL,
  prodID   CHAR(4) NOT NULL,
  prodDate DATETIME NOT NULL,
  prodCur  CHAR(10) NULL,
  CONSTRAINT PK_prodTbl_prodCode_prodID
PRIMARY KEY (prodCode, prodID)
);

DROP TABLE IF EXISTS buyTBL, userTBL;
CREATE TABLE userTBL
( userID  CHAR(8) NOT NULL PRIMARY KEY,
  name    VARCHAR(10) NOT NULL,
  birthYear INT NOT NULL
);

CREATE TABLE buyTBL
( num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  userID CHAR(8) NOT NULL,
  prodName CHAR(6) NOT NULL,
  FOREIGN KEY(userID) REFERENCES userTBL(userID)
);

DROP TABLE IF EXISTS buyTBL;
CREATE TABLE buyTBL
( num INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
  userID CHAR(8) NOT NULL,
  prodName CHAR(6) NOT NULL,
  CONSTRAINT FK_userTBL_buyTBL FOREIGN KEY(userID) REFERENCES userTBL(userID)
);

DROP TABLE IF EXISTS buyTBL;
CREATE TABLE buyTBL
( num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  userID CHAR(8) NOT NULL,
  prodName CHAR(6) NOT NULL
);

ALTER TABLE buyTBL
ADD CONSTRAINT FK_userTBL_buyTBL
FOREIGN KEY (userID)
REFERENCES userTBL(userID);

ALTER TABLE buytbl
DROP FOREIGN KEY FK_usertbl_buytbl; -- 외래 키 제거
ALTER TABLE buytbl
ADD CONSTRAINT FK_usertbl_buytbl
FOREIGN KEY (userID)
REFERENCES usertbl (userID)
ON UPDATE CASCADE;

USE tableDB;
DROP TABLE IF EXISTS buyTBL, userTBL;
CREATE TABLE userTBL
( userID  CHAR(8) NOT NULL PRIMARY KEY,
  name    VARCHAR(10) NOT NULL,
  birthYear INT NOT NULL,
  email   CHAR(30) NULL UNIQUE
);

DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL
( userID  CHAR(8) NOT NULL PRIMARY KEY,
  name    VARCHAR(10) NOT NULL,
  birthYear INT NOT NULL,
  email   CHAR(30) NULL,
  CONSTRAINT AK_email UNIQUE (email)
);

-- 출생년도가 1900년 이후 그리고 2023년 이전, 이름은 반드시 넣어야 함.
DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL
( userID  CHAR(8) PRIMARY KEY,
  name    VARCHAR(10),
  birthYear INT CHECK (birthYear >= 1900 AND birthYear <= 2023),
  mobile1 char(3) NULL,
  CONSTRAINT CK_name CHECK ( name IS NOT NULL )
);

-- 휴대폰 국번 체크
ALTER TABLE userTbl
ADD CONSTRAINT CK_mobile1
CHECK (mobile1 IN ('010', '011', '016', '017', '018', '019'));

DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL
( userID  CHAR(8) NOT NULL PRIMARY KEY,
  name    VARCHAR(10) NOT NULL,
  birthYear INT NOT NULL DEFAULT -1,
  addr    CHAR(2) NOT NULL DEFAULT '서울',
  mobile1 CHAR(3) NULL,
  mobile2 CHAR(8) NULL,
  height    SMALLINT NULL DEFAULT 170,
  mDate     DATE NULL
);

DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL
( userID  CHAR(8) NOT NULL PRIMARY KEY,
  name    VARCHAR(10) NOT NULL,
  birthYear INT NOT NULL,
  addr    CHAR(2) NOT NULL,
  mobile1 CHAR(3) NULL,
  mobile2 CHAR(8) NULL,
  height    SMALLINT NULL,
  mDate     DATE NULL
);

ALTER TABLE userTBL
ALTER COLUMN birthYear SET DEFAULT -1;
ALTER TABLE userTBL
ALTER COLUMN addr SET DEFAULT '서울';
ALTER TABLE userTBL
ALTER COLUMN height SET DEFAULT 170;

-- default문은 DEFAULT로 설정된 값을 자동 입력한다.
INSERT INTO usertbl VALUES('LHL', '이혜리', default, default, '011', '1234567',
                           default, '2023.12.12');

-- 열 이름이 명시되지 않으면 DEFAULT로 설정된 값을 자동 입력한다.
INSERT INTO usertbl(userID, name) VALUES('KAY', '김아영');

-- 값이 직접 명기되면 DEFAULT로 설정된 값은 무시된다.
INSERT INTO usertbl VALUES('WB', '원빈', 1982, '대전', '019', '9876543', 176,
                           '2020.5.5');

SELECT * FROM usertbl;