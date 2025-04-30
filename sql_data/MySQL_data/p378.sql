-- p378

USE sqldb;

CREATE TABLESPACE ts_a ADD DATAFILE 'ts_a.ibd';
CREATE TABLESPACE ts_b ADD DATAFILE 'ts_b.ibd';
CREATE TABLESPACE ts_c ADD DATAFILE 'ts_c.ibd';

CREATE TABLE table_a (id INT) TABLESPACE ts_a;

use sqldb;
create table tbl1
	( 	a int primary key,
		b int,
		c int
	);
	
show index from tbl1;

create	table tbl2
		(	a int primary key,
			b int unique,
            c int unique,
            d int
		);
show index from tbl2;

create table tbl3
	(	a int unique,
		b int unique,
        c int unique,
        d int
	);
show index from tbl3;

CREATE TABLE tbl4
(
    a INT UNIQUE NOT NULL,
    b INT UNIQUE,
    c INT UNIQUE,
    d INT
);
SHOW INDEX FROM tbl4;    

CREATE TABLE tbl5
(
    a INT UNIQUE NOT NULL,
    b INT UNIQUE,
    c INT UNIQUE,
    d INT PRIMARY KEY
);
SHOW INDEX FROM tbl5;

USE testdb;
DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl
( userID  char(8) NOT NULL PRIMARY KEY,
  name    varchar(10) NOT NULL,
  birthYear int NOT NULL,
  addr    nchar(2) NOT NULL
);

INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남');
INSERT INTO usertbl VALUES('JYP', '조용필', 1950, '경기');
INSERT INTO usertbl VALUES('SSK', '성시경', 1979, '서울');
SELECT * FROM usertbl;

ALTER TABLE usertbl DROP PRIMARY KEY ;
ALTER TABLE usertbl
ADD CONSTRAINT pk_name PRIMARY KEY(name);
SELECT * FROM usertbl;

