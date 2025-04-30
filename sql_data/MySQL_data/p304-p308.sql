-- p304

DROP PROCEDURE IF EXISTS whileProc;
DELIMITER $$
CREATE PROCEDURE whileProc()
BEGIN
    DECLARE i INT; -- 1에서 100까지 증가할 변수
    DECLARE hap INT; -- 더한 값을 누적할 변수
    SET i = 1;
    SET hap = 0;

    WHILE (i <= 100) DO
        SET hap = hap + i; -- hap의 원래 값에 i를 더해서 다시 hap에 넣으라는 의미
        SET i = i + 1;   -- i의 원래 값에 1을 더해서 다시 i에 넣으라는 의미
    END WHILE;

    SELECT hap;
END $$
DELIMITER ;
CALL whileProc();

DROP PROCEDURE IF EXISTS whileProc2;
DELIMITER $$
CREATE PROCEDURE whileProc2()
BEGIN
    DECLARE i INT; -- 1에서 100까지 증가할 변수
    DECLARE hap INT; -- 더한 값을 누적할 변수
    SET i = 1;
    SET hap = 0;

    myWhile: WHILE (i <= 100) DO -- While문에 label을 지정
        IF (i%7 = 0) THEN
            SET i = i + 1;
            ITERATE myWhile; -- 지정한 label문으로 가서 계속 진행
        END IF;

        SET hap = hap + i;
        IF (hap > 1000) THEN
            LEAVE myWhile; -- 지정한 label문을 떠남. 즉, While 종료.
        END IF;
        SET i = i + 1;
    END WHILE;

    SELECT hap;
END $$
DELIMITER ;
CALL whileProc2();

DROP PROCEDURE IF EXISTS errorProc;
DELIMITER $$
CREATE PROCEDURE errorProc()
BEGIN
    DECLARE CONTINUE HANDLER FOR 1146 SELECT '테이블이 없어요ㅠㅠ' AS '메시지';
    SELECT * FROM noTable; -- noTable은 없음.
END $$
DELIMITER ;
CALL errorProc();

DROP PROCEDURE IF EXISTS errorProc2;
DELIMITER $$
CREATE PROCEDURE errorProc2()
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        SHOW ERRORS; -- 오류 메시지를 보여 준다.
        SELECT '오류가 발생했네요. 작업을 취소하겠습니다.' AS '메시지';
        ROLLBACK; -- 오류 발생 시 작업을 롤백시킨다.
    END;
    INSERT INTO usertbl VALUES('LSG', '이상구', 1988, '서울', NULL,
                               NULL, 170, CURRENT_DATE()); -- 중복되는 아이디로 오류 발생
END $$
DELIMITER ;
CALL errorProc2();

use sqldb;
PREPARE myQuery FROM 'SELECT * FROM usertbl WHERE userID = "EJW"';
EXECUTE myQuery;
DEALLOCATE PREPARE myQuery;

USE sqldb;
DROP TABLE IF EXISTS myTable;
CREATE TABLE myTable (id INT AUTO_INCREMENT PRIMARY KEY, mDate DATETIME);

SET @curDATE = CURRENT_TIMESTAMP(); -- 현재 날짜와 시간

PREPARE myQuery FROM 'INSERT INTO myTable VALUES(NULL, ?)';
EXECUTE myQuery USING @curDATE;
DEALLOCATE PREPARE myQuery;

SELECT * FROM myTable;
