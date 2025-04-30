-- p220~p222

use sqldb;
create table testtbl1 (id int, userName char(3), age int);
insert into testtbl1 values (1, '홍길동', 25);
insert into testtbl1(id, userName) values (2, '설현');
insert into testtbl1(userName, age, id) values ('하니', 26, 3);

select * from testtbl1;

use sqldb;
create table testTbl2
	(id int AUTO_INCREMENT primary key,
    userName char(3),
    age int );
insert into testTbl2 values (NULL, '지민', 25);
insert into testTbl2 values (NULL, '유나', 22);
insert into testTbl2 values (NULL, '유경', 21);
select * from testtbl2;

ALTER TABLE testTbl2 AUTO_INCREMENT=100;
INSERT INTO testTbl2 VALUES (NULL, '찬미', 23);
SELECT * FROM testTbl2;

USE sqldb;
CREATE TABLE testTbl3
(id int AUTO_INCREMENT PRIMARY KEY,
 userName char(3),
 age int );
ALTER TABLE testTbl3 AUTO_INCREMENT=1000;
SET @@auto_increment_increment=3;
INSERT INTO testTbl3 VALUES (NULL, '나연', 20);
INSERT INTO testTbl3 VALUES (NULL, '정연', 18);
INSERT INTO testTbl3 VALUES (NULL, '모모', 19);
SELECT * FROM testTbl3;

