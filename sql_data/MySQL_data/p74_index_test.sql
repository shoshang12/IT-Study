use employees;

create table indexTBL(
	first_name varchar(14),
    last_name varchar(16),
    hire_date date
    );
    
insert into indexTBL
	select first_name, last_name, hire_date
	from employees
	limit 500;

select * from IndexTBL;

select * from IndexTBL where first_name='Mary';

create index idx_indexTBL_firstname on IndexTBL(first_name);

use shopdb;
create view uv_membeTBL
as
	select memberName, memberAddress from memberTBL;
    
select * from uv_membeTBL;

delimiter //
create procedure myProc()
begin
	select * from memberTBL where memberName = '당탕이';
    select * from prodcutTBL where productName = '냉장고';

end //
delimiter ;

select * from memberTBL where memberName = '당탕이';
select * from prodcutTBL where productName = '냉장고';

