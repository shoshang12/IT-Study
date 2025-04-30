use shopdb;

select * from memberTBL where memberName = '당탕이';
select * from productTBL where productName = '냉장고';

DELIMITER $$
	USE `shopdb`$$
	CREATE PROCEDURE `new_procedure` ()
	BEGIN
		select * from memberTBL where memberName = '당탕이';
		select * from productTBL where productName = '냉장고';
	END$$

DELIMITER ;

call new_procedure();